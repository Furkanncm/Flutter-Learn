import 'dart:io';

import 'package:dio/dio.dart';
import 'package:template/core/base/model/error.dart';
import 'package:template/core/base/model/network_model.dart';
import '../../constants/app/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ?? NetworkManager._init();

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: AppConstants.BASE_URL);
    _dio = Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        BaseError(message: "Dio Error: ${error.message}");
      },
    ));
  }

  late Dio _dio;

  Future<List<T>> dioGetItem<T extends NetworkModel>(
      String path, T model) async {
    final response = await _dio.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseData = response.data;
        if (responseData is List) {
          return responseData
              .map<T>((e) => model.fromJson(e as Map<String, dynamic>))
              .toList();
        } else if (responseData is Map<String, dynamic>) {
          return [model.fromJson(responseData) as T];
        }
        return [];
      default:
        throw BaseError(message: "Dio Error: ${response.statusMessage}");
    }
  }
}
