import 'package:flutter/material.dart';
import 'package:template/core/extensions/context_extension.dart';

class NormalBoardText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const NormalBoardText(
      {super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalLow,
      child: Text(text, style: textStyle),
    );
  }
}
