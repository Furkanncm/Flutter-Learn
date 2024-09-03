import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnswer extends StatefulWidget {
  const CustomAnswer({
    super.key,
    this.onNumber,
  });

  final bool Function(int number)? onNumber;
  @override
  State<CustomAnswer> createState() => CustomAnswerState();
}

class CustomAnswerState extends State<CustomAnswer> {
  late final int number;
  Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
        onPressed: () {
          final int randNumber = Random().nextInt(10);
          print(randNumber);
          final response = widget.onNumber?.call(randNumber) ?? false;
          setState(() {
            _backgroundColor = response ? Colors.green : Colors.red;
          });
        },
        icon: const Icon(Icons.check_circle_outline_outlined),
        label: const Text("Check Your Number"));
  }
}
