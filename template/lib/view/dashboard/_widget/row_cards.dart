import 'package:flutter/material.dart';

import '../../../core/components/text/normal_board_text.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'game_card.dart';

class RowCards extends StatelessWidget {
  final String text;
  const RowCards({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalBoardText(text: text, textStyle: Theme.of(context).textTheme.bodySmall),
            NormalBoardText(text: LocaleKeys.viewAll, textStyle: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const Row(children: [GameCard(), GameCard(), GameCard()]),
      ],
    );
  }
}
