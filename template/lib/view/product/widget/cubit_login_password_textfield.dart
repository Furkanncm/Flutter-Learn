import 'package:flutter/material.dart';

import '../../../core/components/textfield/password_textfield.dart';

class CubitLoginPasswordTextfield extends StatefulWidget {
  final TextEditingController controller;
  const CubitLoginPasswordTextfield({
    super.key,
    required this.controller,
  });

  @override
  State<CubitLoginPasswordTextfield> createState() =>
      _CubitLoginPasswordTextfieldState();
}

class _CubitLoginPasswordTextfieldState
    extends State<CubitLoginPasswordTextfield> {
  @override
  Widget build(BuildContext context) {
    return PasswordTextfield(controller:widget.controller);
  }
}
