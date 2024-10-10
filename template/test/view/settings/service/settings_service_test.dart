import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/view/settings/model/user_model.dart';

void main() {
  final Dio dio = Dio();
  setUp(() {});
  test("Settings service test", () async {
    Future<List<UserModel>?> fetchUsers() async {
      var response = await dio.get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == HttpStatus.ok) {
        final result = response.data as List;
        var data = result.map((e) => UserModel.fromJson(e)).toList();
        return data;
      }
      return [];
    }

    await fetchUsers();
  });
}
