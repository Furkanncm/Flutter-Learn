import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/photos_model.dart';
import '../viewmodel/photos_vievmodel.dart';
import '../../../../Login&OnBoard/product/padding/page_padding.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../product/manager/shop/shop_manager.dart';
import '../../../product/widgets/photo_Card.dart';

class PhotosView extends StatefulWidget {
  const PhotosView({super.key});

  @override
  State<PhotosView> createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  late final PhotosViewModel _photosViewModel;

  @override
  void initState() {
    super.initState();
    _photosViewModel = PhotosViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: _gridView(),
      ),
    );
  }

  Widget _gridView() {
    return Observer(builder: (context) {
      return _photosViewModel.isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.70),
              itemBuilder: (context, index) {
                return PhotoCard(
                  model: _photosViewModel.items?[index] ?? PhotosModel(),
                  viewModel: _photosViewModel,
                );
              },
            );
    });
  }

  AppBar _appBar() {
    return AppBar(
      title: _isLoadingBar(photosViewModel: _photosViewModel),
      actions: [_actionChip()],
    );
  }
}

class _isLoadingBar extends StatelessWidget {
  const _isLoadingBar({
    super.key,
    required PhotosViewModel photosViewModel,
  }) : _photosViewModel = photosViewModel;

  final PhotosViewModel _photosViewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _photosViewModel.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : const SizedBox.shrink();
    });
  }
}

class _actionChip extends StatelessWidget {
  const _actionChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      elevation: 0,
      avatar: Icon(Icons.shopping_bag_outlined),
      label: Consumer<ShopManager>(
        builder: (context, value, child) {
          return Text("${context.read<ShopManager>().TotalBasketPrice()}");
        },
      ),
      onPressed: () {},
    );
  }
}
