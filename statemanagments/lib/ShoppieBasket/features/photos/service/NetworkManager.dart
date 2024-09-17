import 'dart:io';

import '../model/photos_model.dart';
import 'INetworkManager.dart';
import 'networkPath/network_path.dart';

class Networkmanager extends INetworkManager {
  Networkmanager({required super.dio});

  @override
  Future<List<PhotosModel>?> fetchItems()  async {
    var response = await dio.get(NetworkPath.photos.fullPath);
    if (response.statusCode == HttpStatus.ok) {
      var result = response.data;
      if (result is List) {
        return result.map((e) {
          return PhotosModel.fromJson(e);
        }).toList();
      }
    }
    return [];
  }
  
}