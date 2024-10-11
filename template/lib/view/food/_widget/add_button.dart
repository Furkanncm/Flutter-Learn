import 'package:flutter/material.dart';
import '../../../core/components/button/normal_icon_button.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return NormalIconButton(onPressed: onPressed, child: const Icon(Icons.add));
  }
}
