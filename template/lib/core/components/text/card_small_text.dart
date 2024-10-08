import 'package:flutter/material.dart';

import 'card_text.dart';

class CardSmallText extends StatelessWidget {
  final String text;
  const CardSmallText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CardText(
        text: text, textStyle: Theme.of(context).textTheme.labelSmall);
  }
}
