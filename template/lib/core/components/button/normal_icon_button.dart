import 'package:flutter/material.dart';

class NormalIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Widget? child;
  const NormalIconButton({
    super.key,
    this.onPressed,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: color ?? const Color(0xffeba246)),
              child: child ?? const SizedBox.shrink(),
            ),
          ],
        ));
  }
}
