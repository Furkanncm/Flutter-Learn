import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  const CustomText({
    super.key,
    required this.data,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        onPressed: () {},
        child: Text(data, style: textStyle),
      ),
    );
  }
}
