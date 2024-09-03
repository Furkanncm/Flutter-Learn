import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.onNumber});

  final bool Function(int number)? onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _background;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: _background),
      onPressed: () {
        final result = Random().nextInt(10);
        print(result);
        final response = widget.onNumber?.call(result) ?? false;
        setState(() {
          _background = response ? Colors.green : Colors.red;
        });
      },
      label: const Text("Check"),
      icon: const Icon(Icons.check),
    );
  }
}
