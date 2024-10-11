import 'package:flutter/material.dart';
import 'package:template/core/components/button/normal_icon_button.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NormalIconButton(onPressed: onPressed, color: Theme.of(context).colorScheme.onError, child: const Icon(Icons.remove));
  }
}
