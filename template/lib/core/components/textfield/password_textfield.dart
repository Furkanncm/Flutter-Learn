import 'package:flutter/material.dart';

import '../../init/language/locale_keys.g.dart';
import 'base_textfield.dart';

class PasswordTextfield extends StatelessWidget {
  final TextEditingController controller;
  const PasswordTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    return BaseTextFormfield(
      controller: controller,
      keyboardType: TextInputType.number,
      text: LocaleKeys.password,
      prefixIcon: Icons.lock_outline,
      isVisible: isVisible,
      suffixIcon: IconButton(
          onPressed: () {
            //TO DO cubit ile yapılacak
            isVisible = !isVisible;
          },
          icon: isVisible
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility_outlined)),
      validator: (value) {
        return value!.length > 6 ? "" : LocaleKeys.passwordNotValidate;
      },
    );
  }
}
