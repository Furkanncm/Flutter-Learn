import 'package:dio/dio.dart';
import 'package:statemanagments/ShoppieBasket/features/photos/model/photos_model.dart';

abstract class INetworkManager {
  final Dio dio;
  INetworkManager({required this.dio});
  Future<List<PhotosModel>?> fetchItems();
}
