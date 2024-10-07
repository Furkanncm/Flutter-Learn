import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/base/model/network_model.dart';
import 'package:template/core/constants/app/app_constants.dart';
import 'package:template/core/constants/enum/http_type_enum.dart';
import 'package:template/core/extensions/http_type_extension.dart';
import 'package:template/core/init/network/ICoreDio.dart';
import 'package:template/view/authentication/test/model/test_model.dart';

void main() { 
  late Icoredio coredio;
  setUp(() {
    coredio = MockDio(BaseOptions(baseUrl: AppConstants.BASE_URL));
  });
  test("LuciTest", () async {
    var response = await coredio.httpEvents<List<TestModel>, TestModel>(
        "posts", HttpTypeEnum.GET, TestModel());
    print(response?.length);
    expect(response, isList);
  });
}

class MockDio with DioMixin implements Dio, Icoredio {
  final BaseOptions _baseOptions;

  MockDio(this._baseOptions) {
    options = _baseOptions;
    httpClientAdapter = HttpClientAdapter();
    interceptors.add(InterceptorsWrapper());
  }
  @override
  Future<R?> httpEvents<R, T extends NetworkModel>(
      String path, HttpTypeEnum type, T model,
      {dynamic data}) async {
    var response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        return fetchItems<R, T>(model, response.data);
      default:
        throw Exception("Error");
    }
  }

  R? fetchItems<R, T>(NetworkModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map<String, dynamic>) {
      return model.fromJson(data) as R;
    } else {
      return data as R;
    }
  }
}
