import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/constants/contant_values/kvalues.dart';
import '../../../../core/constants/enum/image_enum.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/image_extensions.dart';
import '../../widget/cubit_login_email_textfield.dart';
import '../../widget/cubit_login_forgot_textbutton.dart';
import '../../widget/cubit_login_password_textfield.dart';

import '../../../../core/init/language/locale_keys.g.dart';
import '../../widget/cubit_login_have_account.dart';

class CubitLoginView extends StatefulWidget {
  const CubitLoginView({super.key});
  @override
  State<CubitLoginView> createState() => _CubitLoginViewState();
}

class _CubitLoginViewState extends BaseState<CubitLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_BodyForm(), _ElevatedButton(), CubitLoginHaveAccount()],
      ),
    );
  }
}

class _BodyForm extends StatelessWidget {
  _BodyForm();

  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CubitLoginEmailTextfield(controller: emailController),
              CubitLoginPasswordTextfield(),
              CubitLoginForgotTextbutton(),
            ],
          ),
        ));
  }
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Center(
          child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: context.paddingNormal,
                child: Text(
                  LocaleKeys.loginButton,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ))),
    );
  }
}
