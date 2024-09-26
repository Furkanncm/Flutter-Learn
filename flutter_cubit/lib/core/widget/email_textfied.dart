import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cubit/core/components/root_text_field.dart';

import '../init/language/locale_keys.g.dart';

class EmailTextfied extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextfied({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RootTextField(
      inputType: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
      hintText: LocaleKeys.loginEmail,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.emailNull.tr();
        } else if (!value.contains('@')) {
          return LocaleKeys.emailNotValid.tr();
        }
        return null;
      
      },
    );
  }
}
