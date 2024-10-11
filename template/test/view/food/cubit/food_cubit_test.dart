import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/constants/app/app_constants.dart';
import 'package:template/core/constants/enum/service_path_enum.dart';
import 'package:template/core/extensions/service_path_extensions.dart';
import 'package:template/view/food/model/food_model.dart';

void main() {
  final dio = Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL));
  setUp(() {});
  test("Food Service", () async {
    Future<FoodModel?> fetchUsers() async {
      var response = await dio.get(ServicePathEnum.USERS.rawValue);
      if (response.statusCode == HttpStatus.ok) {
        final result = response.data;
        final data = FoodModel.fromJson(result as Map<String, dynamic>);
        return data;
      }
      return null;
    }

    await fetchUsers();
  });
}
