import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import '../../init/language/locale_keys.g.dart';
import 'base_textfield.dart';

class EmailTextfield extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormfield(
      controller: controller,
      keyboardType: TextInputType.text,
      text: LocaleKeys.email,
      prefixIcon: Icons.email_outlined,
      validator: (value) {
        controller.text.contains(AppConstants.EMAIL_REGEX)
            ? null
            : LocaleKeys.emailNotValidate;
        return null;
      },
    );
  }
}
