import 'package:flutter/material.dart';

import '../../features/onboard/model/on_board_model.dart';

class Onboardcard extends StatelessWidget {
  const Onboardcard({
    super.key,
    required this.model,
  });
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
  }
}
