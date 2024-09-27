import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_cubit/core/constants/enum/service_path_enum.dart';
import 'package:flutter_cubit/core/extensions/service_path_extension.dart';
import 'package:flutter_cubit/feature/login/model/request_model.dart';
import 'package:flutter_cubit/feature/login/model/response_model.dart';
import 'package:flutter_cubit/feature/login/service/ILoginService.dart';

import '../../../core/constants/application_constants.dart';

class LoginService extends ILoginService {
  LoginService({required super.dio}) {
    dio.options.baseUrl = ApplicationConstants.BaseUrl; // Base URL ayarı
  }

  @override
  Future<ResponseModel?> login(RequestModel requestmodel) async {
    final response =
        await dio.post(ServicePathEnum.login.rawValue, data: requestmodel.toJson());
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final responseData = response.data;
        return ResponseModel.fromJson(responseData);
    }
  }
}
