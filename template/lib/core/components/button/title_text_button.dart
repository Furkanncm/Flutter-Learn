import 'package:flutter/material.dart';

import 'normal_elevated_button.dart';

class TitleTextButton extends StatelessWidget {
  final String text;
  final Function(String text) onPressed;
  const TitleTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return NormalButton(
        child: Center(child: Text(text)),
        onPressed: () {
          onPressed(text);
        });
  }
}
