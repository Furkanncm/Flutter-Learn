import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/product/advanceLogin/cubit/cubit_login.dart';
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
    return BaseTextFormfield(
      controller: controller,
      keyboardType: TextInputType.number,
      text: LocaleKeys.password,
      prefixIcon: Icons.lock_outline,
      isVisible: context.watch<CubitLoginCubit>().isVisible,
      suffixIcon: IconButton(
          onPressed: () {
            context.read<CubitLoginCubit>().changVisibility();
          },
          icon: (context.watch<CubitLoginCubit>().isVisible)
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility_outlined)),
      validator: (value) {
        return controller.text.length > 6
            ? null
            : LocaleKeys.passwordNotValidate;
      },
    );
  }
}
