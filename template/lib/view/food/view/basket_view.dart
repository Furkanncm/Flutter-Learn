import 'package:flutter/material.dart';
import 'package:template/view/food/_widget/food_card.dart';

import '../../../core/init/language/locale_keys.g.dart';

class BasketView extends StatefulWidget {
  final bloc;
  const BasketView({super.key, required this.bloc});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.popularFoods),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
            itemCount: widget.bloc.basketedItems.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return FoodCard(model: widget.bloc.basketedItems[index]);
            },
          )),
        ],
      ),
    );
  }
}
