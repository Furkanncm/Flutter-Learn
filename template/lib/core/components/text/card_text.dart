import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const CardText({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 2, style: textStyle ?? const TextStyle());
  }
}
