import 'package:flutter/material.dart';

class NormalTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const NormalTextButton(
      {super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }
}
