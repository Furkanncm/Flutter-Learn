import 'package:flutter/material.dart';
import 'package:template/core/components/text/card_small_text.dart';
import 'package:template/core/extensions/context_extension.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final String text;
  final Widget? suffixChild;
  const CustomCard({
    super.key,
    required this.child,
    required this.text,
    this.suffixChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.08,
      child: Card(
        child: Padding(
          padding: context.paddingLow,
          child: Row(
            children: [
              child,
              Padding(
                padding: context.leftNormal,
                child: CardSmallText(text: text),
              ),
              Padding(
                padding: EdgeInsets.only(left: context.width * 0.4),
                child: suffixChild ?? const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
