import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/core/base/base_state.dart';
import 'package:flutter_cubit/feature/login/model/request_model.dart';
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
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
          emailController: emailController,
          passwordController: passwordController,
          globalKey: globalKey),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: _appbar(context, state),
            body: _formView(context, state),
          );
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context, LoginState state) {
    return AppBar(
      leading: (state is LoginPost)
          ? Icon(Icons.check_box)
          : Icon(Icons.warning_amber),
      title: _title(),
    );
  }

  Widget _formView(BuildContext context, LoginState state) {
    return Form(
      key: globalKey,
      autovalidateMode: (state is LoginValidate)
          ? state.isFail
              ? AutovalidateMode.always
              : AutovalidateMode.disabled
          : AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CubitEmailTextfield(controller: emailController),
          CubitPasswordTextfield(controller: passwordController),
          _elevatedButton(context)
        ],
      ),
    );
  }

  ElevatedButton _elevatedButton(BuildContext context) {
    return ElevatedButton(
            onPressed: () {
              final RequestModel requestModel = RequestModel(
                  email: emailController.text,
                  password: passwordController.text);
              context.read<LoginCubit>().postUserLogin(requestModel);
            },
            child: const Center(child: Icon(Icons.login_outlined)));
  }

  Center _title() => Center(child: Text(LocaleKeys.login.tr()));
}
