import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/view/product/advanceLogin/cubit/cubit_login.dart';
import '../../../core/components/button/normal_text_button.dart';
import '../../../core/extensions/context_extension.dart';

import '../../../core/init/language/locale_keys.g.dart';

class CubitLoginForgotTextbutton extends StatelessWidget {
  const CubitLoginForgotTextbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.leftHigh,
      child: NormalTextButton(
          child: Text(LocaleKeys.forgotPassword,
              style: Theme.of(context).textTheme.labelMedium),
          onPressed: () {
            context.read<CubitLoginCubit>().changeForgotState(context);
          }),
    );
  }
}
