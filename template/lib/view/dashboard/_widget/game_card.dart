import 'package:flutter/material.dart';
import 'package:template/core/extensions/context_extension.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("https://picsum.photos/200/300"),
            Text("text", style: Theme.of(context).textTheme.labelMedium),
            Text("data", style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
