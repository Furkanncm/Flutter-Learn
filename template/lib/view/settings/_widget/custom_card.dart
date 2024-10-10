import 'package:flutter/material.dart';
import '../../../core/components/text/card_small_text.dart';
import '../../../core/extensions/context_extension.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final String text;
  final Widget? suffixChild;
  final Future<dynamic> Function()? onPressed;
  const CustomCard({
    super.key,
    required this.child,
    required this.text,
    this.suffixChild,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalLow,
      child: SizedBox(
        height: context.height * 0.08,
        child: Card(
          elevation: 5,
          color: Theme.of(context).secondaryHeaderColor,
          child: ListTile(
            onTap: () {
              onPressed?.call();
            },
            leading: child,
            title: CardSmallText(text: text),
            trailing: suffixChild,
          ),
        ),
      ),
    );
  }
}
