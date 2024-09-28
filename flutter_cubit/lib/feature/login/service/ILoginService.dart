import 'package:dio/dio.dart';
import '../model/request_model.dart';
import '../model/response_model.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService({required this.dio});
 Future<ResponseModel?> login(RequestModel requestmodel);
}
