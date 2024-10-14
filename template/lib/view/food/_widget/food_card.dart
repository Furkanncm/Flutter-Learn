import 'package:flutter/material.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../model/food_model.dart';
import 'add_button.dart';
import 'remove_button.dart';

class FoodCard extends StatelessWidget {
  final Recipes model;
  const FoodCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: context.paddingNormal,
            child: Image.network(
              model.image ?? AppConstants.RAND_IMAGE,
              width: context.width * 0.25,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name ?? 'Title', style: const TextStyle(color: Colors.black)),
              Text(model.cuisine ?? 'Description', style: const TextStyle(color: Colors.black)),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text(model.rating.toString(), style: const TextStyle(color: Colors.black)),
                  SizedBox(
                    width: context.width * 0.08,
                  ),
                  RemoveButton(
                    onPressed: () {},
                  ),
                  const Text("0", style: TextStyle(color: Colors.black)),
                  AddButton(onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
