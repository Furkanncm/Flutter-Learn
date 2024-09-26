import 'package:flutter/material.dart';

import 'package:flutter_cubit/core/widget/password_textfield.dart';

class CubitPasswordTextfield extends StatefulWidget {
  final TextEditingController controller;
  const CubitPasswordTextfield({super.key, required this.controller});

  @override
  State<CubitPasswordTextfield> createState() => _CubitPasswordTextfieldState();
}

class _CubitPasswordTextfieldState extends State<CubitPasswordTextfield> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return PasswordTextfield(
      controller: widget.controller,
      isVisible: isVisible,
      onPressed: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
    );
  }
}
