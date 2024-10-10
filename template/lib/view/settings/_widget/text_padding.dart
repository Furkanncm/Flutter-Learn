import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class TextPadding extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextPadding({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(text, style: style ?? const TextStyle()),
    );
  }
}
