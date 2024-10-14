import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/view/food/cubit/food_cubit.dart';

import '../../../core/extensions/context_extension.dart';
import '../model/food_model.dart';
import 'add_button.dart';
import 'remove_button.dart';

class MenuCard extends StatelessWidget {
  final Recipes model;
  const MenuCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  width: context.width * 0.9,
                  height: context.height * 0.28,
                  child: Image.network(fit: BoxFit.fill, model.image ?? ""),
                ),
                _StarCard(model: model),
              ],
            ),
          ),
          Center(
              child: Text(model.name ?? "",
                  style: const TextStyle(color: Colors.black, fontSize: 20))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.flag_outlined),
              Text(model.cuisine ?? "", style: const TextStyle(color: Colors.black)), //cuisine
              SizedBox(width: context.width * 0.18),
              const Icon(Icons.timer),
              Text("${model.cookTimeMinutes.toString()} \$",
                  style: const TextStyle(color: Colors.black)), //cookTimeMinutes
              SizedBox(width: context.width * 0.18),
              BlocBuilder<FoodCubit, FoodCubitState>(
                builder: (context, state) {
                  return context.watch<FoodCubit>().basketedItems.contains(model)
                      ? RemoveButton(onPressed: () {
                          context.read<FoodCubit>().itemToBasket(model);
                        })
                      : AddButton(onPressed: () {
                          context.read<FoodCubit>().itemToBasket(model);
                        });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _StarCard extends StatelessWidget {
  final Recipes model;
  const _StarCard({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: context.height * 0.20,
        left: context.width * 0.02,
        right: context.width * 0.5,
        bottom: context.width * 0.02,
        child: Card(
          child: Padding(
            padding: context.paddinglow2xValue * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text(model.rating.toString(), style: const TextStyle(color: Colors.black)),
                  icon: const Icon(Icons.star, color: Colors.amber),
                ),
                Text("(${model.reviewCount.toString()}+)",
                    style: const TextStyle(color: Colors.black)), //reviewCount
              ],
            ),
          ),
        ));
  }
}
