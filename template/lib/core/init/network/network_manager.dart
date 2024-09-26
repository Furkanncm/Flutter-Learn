import 'package:dio/dio.dart';
import 'package:template/core/init/network/ICoreDio.dart';

import '../../constants/app/app_constants.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late Icoredio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: AppConstants.BASE_URL);
    
    coreDio = CoreDio(baseOptions: baseOptions);
  }
}
