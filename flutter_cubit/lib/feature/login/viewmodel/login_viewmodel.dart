import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/application_constants.dart';
import '../model/request_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

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

  bool isLoading = false;
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

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading: isLoading));
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidate extends LoginState {
  final bool isFail;

  LoginValidate({required this.isFail});
}

class LoginLoading extends LoginState {
  final bool isLoading;
  LoginLoading({required this.isLoading});
}

class LoginPost extends LoginState {
  final ResponseModel responseModel;

  LoginPost({required this.responseModel});
}
