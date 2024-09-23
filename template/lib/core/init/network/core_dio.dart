import 'dart:io';

import 'package:dio/dio.dart';
import '../../base/model/error.dart';
import '../../base/model/network_model.dart';
import '../../constants/enum/http_type_enum.dart';
import '../../extensions/http_type_extension.dart';
import 'ICoreDio.dart';

class CoreDio with DioMixin implements Dio, Icoredio {
  final BaseOptions _baseOptions;

  CoreDio({required BaseOptions baseOptions}) : _baseOptions = baseOptions;

  Future<R?> httpEvents<R, T extends NetworkModel>(
      String path, HttpTypeEnum type, T model,
      {dynamic data}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _fetch(model, response.data);
      default:
        BaseError(message: "message");
    }
  }

  R? _fetch<R>(NetworkModel model, dynamic data) {
    if (data is List) {
      data.map((e) {
        return model.fromJson(e);
      }).toList() as R;
    } else if (data is Map<String, dynamic>) {
      return model.fromJson(data) as R;
    } else {
      return data;
    }
    return null;
  }
}
