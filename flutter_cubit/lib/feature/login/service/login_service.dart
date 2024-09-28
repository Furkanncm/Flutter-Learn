import 'dart:io';
import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extension.dart';
import '../model/request_model.dart';
import '../model/response_model.dart';
import 'ILoginService.dart';

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
