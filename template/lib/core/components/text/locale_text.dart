import 'package:flutter/material.dart';
import 'package:template/core/extensions/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String text;
    LocaleText({
    required this.text
  });


  @override
  Widget build(BuildContext context) {
    return Text(text.locale);
  }
}
