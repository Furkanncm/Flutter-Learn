import 'dart:io';

import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extensions.dart';
import '../model/user_model.dart';
import 'ISettingsService.dart';

class SettingsService extends ISettingsService {
  SettingsService({required super.dio});

  @override
  Future<List<UserModel>?> fetchUsers() async {
    var response = await dio.get(ServicePathEnum.USERS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final result = response.data as List;
      return result.map((e) => UserModel.fromJson(e)).toList();
    }
    return [];
  }
}
