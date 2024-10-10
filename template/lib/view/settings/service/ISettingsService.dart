import 'package:dio/dio.dart';

import '../model/user_model.dart';

abstract class ISettingsService {
  final Dio dio;

  ISettingsService({required this.dio});
  Future<List<UserModel>?> fetchUsers();
}
