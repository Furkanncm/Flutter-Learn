import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:statemanagments/ShoppieBasket/features/photos/model/photos_model.dart';
import 'package:statemanagments/ShoppieBasket/features/photos/viewmodel/photos_vievmodel.dart';

import '../manager/shop/shop_manager.dart';

class PhotoCard extends StatefulWidget {
  const PhotoCard({
    super.key,
    required this.model,
    required this.viewModel,
  });
  final PhotosModel model;
  final PhotosViewModel viewModel;

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard>
    with AutomaticKeepAliveClientMixin {
  bool isMarketed = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Stack(
        children: [
          _listTileWidget(),
          Positioned(
            child: Consumer<ShopManager>(builder: (context, value, child) {
              return Card(
                child: IconButton(
                    onPressed: () {
                      value.addFavorite(widget.model);
                    },
                    icon: widget.model.isFavorite
                        ? Icon(Icons.favorite_outlined)
                        : Icon(Icons.favorite_border_outlined)),
              );
            }),
          ),
          Positioned(
            right: 5,
            child: isMarketed
                ? const SizedBox.shrink()
                : _basketWidget(context, widget.model),
          ),
          Positioned(
            top: 205,
            right: 30,
            child: AddandRemoveCard(),
          ),
        ],
      ),
    );
  }

  ListTile _listTileWidget() {
    return ListTile(
      title: Image.network(widget.model.url ?? ""),
      subtitle: Text(
        widget.model.title ?? "",
        maxLines: 2,
      ),
    );
  }

  Card _basketWidget(BuildContext context, PhotosModel model) {
    return Card(
      elevation: 10,
      child: IconButton(
          onPressed: () {
            context.read<ShopManager>().addToBasket(model);
            changeMarketed();
          },
          icon: const Icon(Icons.shopping_basket_outlined)),
    );
  }

  Widget AddandRemoveCard() {
    return SafeArea(
      child: AnimatedContainer(
        duration: Durations.extralong1,
        height: isMarketed ? 45 : 0,
        width: isMarketed ? 130 : 0,
        child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _incrementProduct()),
                Consumer<ShopManager>(
                  builder: (context, value, child) {
                    return Text("${widget.model.productCount}");
                  },
                ),
                Expanded(child: _decreaseProduct()),
              ],
            )),
      ),
    );
  }

  IconButton _incrementProduct() {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        context.read<ShopManager>().addItem(widget.model);
      },
      icon: const Icon(Icons.add),
    );
  }

  IconButton _decreaseProduct() {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        context.read<ShopManager>().removeItem(widget.model);
      },
      icon: const Icon(Icons.remove),
    );
  }

  void changeMarketed() {
    setState(() {
      isMarketed = !isMarketed;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
