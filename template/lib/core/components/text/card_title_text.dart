import 'package:flutter/material.dart';

import 'card_text.dart';

class CardTitleText extends StatelessWidget {
  final String text;
  const CardTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CardText(
        text: text,
        textStyle: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: Theme.of(context).dividerColor));
  }
}
