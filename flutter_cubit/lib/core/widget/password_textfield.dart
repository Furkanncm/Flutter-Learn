import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../components/root_text_field.dart';

import '../init/language/locale_keys.g.dart';

class PasswordTextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool? isVisible;
  final VoidCallback onPressed;
  const PasswordTextfield({
    super.key,
    required this.controller,
    this.isVisible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RootTextField(
      inputType: TextInputType.text,
      prefixIcon: Icons.lock_outline_rounded,
      hintText: LocaleKeys.loginPassword,
      isVisible: isVisible,
      controller: controller,
      suffixIcon: (isVisible ?? true)
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
      onPressed: onPressed,
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.passwordNull.tr();
        } else if (value.length < 6) {
          return LocaleKeys.passwordShort.tr();
        }
        return null;
      },
    );
  }
}
