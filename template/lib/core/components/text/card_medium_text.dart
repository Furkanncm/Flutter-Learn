import 'package:flutter/material.dart';

import 'card_text.dart';

class CardMediumText extends StatelessWidget {
  final String text;
  const CardMediumText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CardText(
        text: text, textStyle: Theme.of(context).textTheme.labelMedium);
  }
}
