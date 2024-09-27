import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/core/constants/application_constants.dart';
import 'package:flutter_cubit/feature/login/model/request_model.dart';
import 'package:flutter_cubit/feature/login/service/ILoginService.dart';
import 'package:flutter_cubit/feature/login/service/login_service.dart';

import '../model/response_model.dart';

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
  final ILoginService service = LoginService(
      dio: Dio(BaseOptions(baseUrl: ApplicationConstants.BaseUrl)));

  void postUserLogin(RequestModel requestModel) async {
    final response = await service.login(requestModel);
    if (response != null) {
      emit(LoginPost(responseModel: response));
    } else {
      emit(LoginValidate(isFail: false));
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidate extends LoginState {
  final bool isFail;

  LoginValidate({required this.isFail});
}

class LoginPost extends LoginState {
  final ResponseModel responseModel;

  LoginPost({required this.responseModel});
}
