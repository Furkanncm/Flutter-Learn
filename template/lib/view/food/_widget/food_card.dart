import 'package:flutter/material.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/context_extension.dart';
import 'remove_button.dart';
import '../model/food_model.dart';

import 'add_button.dart';

class FoodCard extends StatelessWidget {
  final FoodModel model;
  const FoodCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Row(
        children: [
          Padding(
            padding: context.paddingNormal,
            child: Image.network(
              model.recipes?[1].image ?? AppConstants.RAND_IMAGE,
              width: context.width * 0.25,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.recipes?[1].name ?? 'Title'),
              Text(model.recipes?[1].cuisine ?? 'Description'),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text(model.recipes?[1].rating.toString() ?? 'Rating'),
                  SizedBox(
                    width: context.width * 0.08,
                  ),
                  RemoveButton(
                    onPressed: () {},
                  ),
                  const Text("0"),
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
