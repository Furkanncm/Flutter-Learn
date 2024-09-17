import 'package:dio/dio.dart';

import '../model/photos_model.dart';

abstract class INetworkManager {
  final Dio dio;
  INetworkManager({required this.dio});
  Future<List<PhotosModel>?> fetchItems();
}
