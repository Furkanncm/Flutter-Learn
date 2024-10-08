import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/constants/app/app_constants.dart';
import 'package:template/core/constants/enum/service_path_enum.dart';
import 'package:template/core/extensions/service_path_extensions.dart';
import 'package:template/view/find-friends/model/find_friends.dart';

main()  {
  final Dio dio = Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL));
  setUp(() {
    print("Here");
  });

  test('User Login Test', () async {
      final response = await dio.get(ServicePathEnum.CARTS.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => FindFriends.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          if (data.containsKey('carts') && data['carts'] is List) {
            return (data['carts'] as List).map((e) => FindFriends.fromJson(e as Map<String, dynamic>)).toList();
          }
        } else {
          return data;
        }
    }
    return [];
  });
}
