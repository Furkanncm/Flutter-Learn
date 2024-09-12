import 'package:flutter/material.dart';
import 'package:statemanagments/features/onboard/model/on_board_model.dart';

class Onboardcard extends StatelessWidget {
  const Onboardcard({
    Key? key,
    required this.model,
  }) : super(key: key);
  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(model.description),
        Expanded(child: model.lottie),
      ],
    );
    ;
  }
}
