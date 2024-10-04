import 'package:flutter/material.dart';

import '../../../core/components/textfield/email_textfield.dart';

class CubitLoginEmailTextfield extends StatefulWidget {
  final TextEditingController controller;
  const CubitLoginEmailTextfield({
    super.key,
    required this.controller,
  });

  @override
  State<CubitLoginEmailTextfield> createState() =>
      _CubitLoginEmailTextfieldState();
}

class _CubitLoginEmailTextfieldState extends State<CubitLoginEmailTextfield> {
  @override
  Widget build(BuildContext context) {
    return EmailTextfield(controller: widget.controller);
  }
}
