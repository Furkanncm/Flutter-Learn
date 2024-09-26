import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  LoginCubit({
    required this.emailController,
    required this.passwordController,
    required this.globalKey,
  }) : super(LoginInitial());

  bool isLogin = false;
  void checkUserLogin() {
    if (globalKey.currentState?.validate() ?? false) {
      if (emailController.text == 'admin' &&
          passwordController.text == 'admin') {
        emit(LoginExp(isFail: false));
      } else {
        isLogin = true;
        emit(LoginExp(isFail: isLogin));
      }
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginExp extends LoginState {
  final bool isFail;

  LoginExp({required this.isFail});
}
