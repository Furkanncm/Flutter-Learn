import 'dart:io';

import 'package:furkann/303/mvvm_Mobx/features/photo/model/PhotoModel.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/service/IPhotoService.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/service/serviceEndpoints/ServiceEndpoints.dart';

class Photoservice extends Iphotoservice {
  Photoservice({required super.dio});

  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    var response = await dio.get(Serviceendpoints.photos.withRoute);
    if (response.statusCode == HttpStatus.ok) {
      var datas = response.data;
      if (datas is List) {
        return datas.map((e) {
          return PhotoModel.fromJson(e);
        }).toList();
      }
    }
    return [];
  }
}
