import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_login.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../widget/cubit_login_email_textfield.dart';
import '../../widget/cubit_login_forgot_textbutton.dart';
import '../../widget/cubit_login_have_account.dart';
import '../../widget/cubit_login_password_textfield.dart';
import '../cubit/Icubit_login.dart';

class CubitLoginView extends StatefulWidget {
  const CubitLoginView({
    super.key,
  });
  @override
  State<CubitLoginView> createState() => _CubitLoginViewState();
}

class _CubitLoginViewState extends BaseState<CubitLoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CubitLoginCubit>(
      create: (context) =>
          CubitLoginCubit(emailController, passwordController, formKey),
      child: Scaffold(
        body: Column(
          children: [
            _BodyForm(
                emailController: emailController,
                passwordController: passwordController,
                formKey: formKey),
            const _ElevatedButton(),
            const CubitLoginHaveAccount()
          ],
        ),
      ),
    );
  }
}

class _BodyForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const _BodyForm({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CubitLoginEmailTextfield(controller: emailController),
              CubitLoginPasswordTextfield(controller: passwordController),
              const CubitLoginForgotTextbutton(),
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
        child: BlocBuilder<CubitLoginCubit, CubitLoginCubitState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                context.read<CubitLoginCubit>().isFormValidate(context);
              },
              child: Padding(
                padding: context.paddingNormal,
                child: Text(
                  LocaleKeys.loginButton,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
