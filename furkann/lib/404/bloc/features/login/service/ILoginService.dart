import 'package:dio/dio.dart';
import '../model/login_model.dart';
import '../../../../../model/token_model.dart';

abstract class Iloginservice {
  final Dio dio;

  Iloginservice({required this.dio});

  Future<TokenModel?> login(LoginModel loginmodel);
}
