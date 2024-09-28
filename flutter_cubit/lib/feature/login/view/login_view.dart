import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/feature/login/model/response_model.dart';
import 'package:flutter_cubit/feature/login/view/login_detail_view.dart';
import '../../../core/base/base_state.dart';
import '../model/request_model.dart';
import '../../widget/cubit_email_textfield.dart';

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
      leading: context.watch<LoginCubit>().isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : const SizedBox.shrink(),
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
          _elevatedButton(context, state)
        ],
      ),
    );
  }

  ElevatedButton _elevatedButton(BuildContext context, LoginState state) {
    return ElevatedButton(
        onPressed: () {
          final RequestModel requestModel = RequestModel(
              email: emailController.text, password: passwordController.text);
          context.read<LoginCubit>().postUserLogin(requestModel);
          final currentState = context.read<LoginCubit>().state;
          print(currentState);
          if (currentState is LoginPost) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    LoginDetailView(model: currentState.responseModel)));
          }
        },
        child: const Center(child: Icon(Icons.login_outlined)));
  }

  Center _title() => Center(child: Text(LocaleKeys.login.tr()));
}
