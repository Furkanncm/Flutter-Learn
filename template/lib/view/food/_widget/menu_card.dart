import 'package:flutter/material.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/view/food/model/food_model.dart';

import 'add_button.dart';

class MenuCard extends StatelessWidget {
  final Recipes? model;
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
                  height: context.height * 0.24,
                  child: Image.network(fit: BoxFit.fill, "https://picsum.photos/200"),
                ),
                const _starCard(),
              ],
            ),
          ),
          Center(child: Text(model?.name ?? "", style: const TextStyle(color: Colors.black, fontSize: 20))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.flag_outlined),
              const Text("Turkey", style: TextStyle(color: Colors.black)), //cuisine
              SizedBox(width: context.width * 0.18),
              const Icon(Icons.timer),
              const Text("35 min", style: TextStyle(color: Colors.black)), //cookTimeMinutes &prepTimeMinutes
              SizedBox(width: context.width * 0.18),
              AddButton(onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}

class _starCard extends StatelessWidget {
  const _starCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: context.height * 0.18,
        left: context.width * 0.02,
        right: context.width * 0.55,
        bottom: context.width * 0.02,
        child: Card(
          child: Padding(
            padding: context.paddingLow,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("4.3", style: TextStyle(color: Colors.black)), //rating
                Icon(Icons.star, color: Colors.amber),
                Text("20+", style: TextStyle(color: Colors.black)), //reviewCount
              ],
            ),
          ),
        ));
  }
}
