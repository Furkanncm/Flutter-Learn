import 'package:flutter/material.dart';

import 'package:flutter_cubit/core/widget/email_textfied.dart';

class CubitEmailTextfield extends StatelessWidget {
  final TextEditingController controller;
  const CubitEmailTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextfied(controller: controller);
  }
}
