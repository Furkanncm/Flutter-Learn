import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import 'text_padding.dart';

class PositionedItem extends StatelessWidget {
  final String text;
  final double? top;
  final double? bottom;
  const PositionedItem({super.key, required this.text, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Positioned(top: top ?? 0, bottom: bottom ?? 2, left: context.width * 0.01, child: TextPadding(text: text, style: Theme.of(context).textTheme.labelSmall));
  }
}
