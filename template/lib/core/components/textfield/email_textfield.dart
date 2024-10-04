import 'package:flutter/material.dart';
import '../../base/model/error.dart';

import 'base_textfield.dart';
import '../../constants/app/app_constants.dart';
import '../../init/language/locale_keys.g.dart';

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
        (value?.contains(AppConstants.EMAIL_REGEX) ?? false)
            ? ""
            : BaseError(message: LocaleKeys.emailNotValidate);
        return null;
      },
    );
  }
}
