import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/core/base/base_state.dart';
import 'package:flutter_cubit/feature/widget/cubit_email_textfield.dart';

import '../../../core/init/language/locale_keys.g.dart';
import '../../widget/cubit_password_textfield.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _title()),
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
            emailController: emailController,
            passwordController: passwordController,
            globalKey: globalKey),
        child: _formView(),
      ),
    );
  }

  Widget _formView() {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CubitEmailTextfield(controller: emailController),
          CubitPasswordTextfield(controller: passwordController),
          ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().checkUserLogin();
              },
              child: const Center(child: Icon(Icons.login_outlined)))
        ],
      ),
    );
  }

  Center _title() => Center(child: Text(LocaleKeys.login.tr()));
}
