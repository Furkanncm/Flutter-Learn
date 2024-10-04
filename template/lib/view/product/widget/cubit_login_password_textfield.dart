import 'package:flutter/material.dart';

import '../../../core/components/textfield/password_textfield.dart';

class CubitLoginPasswordTextfield extends StatefulWidget {
  const CubitLoginPasswordTextfield({super.key});

  @override
  State<CubitLoginPasswordTextfield> createState() =>
      _CubitLoginPasswordTextfieldState();
}

class _CubitLoginPasswordTextfieldState
    extends State<CubitLoginPasswordTextfield> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PasswordTextfield(controller: controller);
  }
}
