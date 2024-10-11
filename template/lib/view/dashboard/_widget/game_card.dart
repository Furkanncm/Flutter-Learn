import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../cubit/dashboard_cubit.dart';
import '../model/game_model.dart';

class GameCard extends StatelessWidget {
  final DashboardCubitState state;
  final GameModel model;
  const GameCard({
    super.key,
    required this.state,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(child: Image.network(state is ItemLoaded ? model.images!.first.replaceAll('"', "").replaceAll("[", "").replaceAll("]", "") : "https://picsum.photos/200")),
            Text(maxLines: 1, model.title ?? "", style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12)),
            Text("${model.price.toString()} TL", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400)),
          ],
        ));
  }
}
