import 'dart:io';

import 'package:dio/dio.dart';
import '../../base/model/error.dart';
import '../../base/model/network_model.dart';
import 'ICoreDio.dart';
import '../../constants/app/app_constants.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ?? NetworkManager._init();

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: AppConstants.BASE_URL);
    coreDio = CoreDio(baseOptions: baseOptions);
  }
  late Icoredio coreDio;

}
