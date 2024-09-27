import 'package:dio/dio.dart';
import 'package:flutter_cubit/feature/login/model/request_model.dart';
import 'package:flutter_cubit/feature/login/model/response_model.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService({required this.dio});
 Future<ResponseModel?> login(RequestModel requestmodel);
}
