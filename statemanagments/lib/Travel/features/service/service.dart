import 'dart:io';

import '../model/travel_model.dart';
import 'IService.dart';

class Service extends Iservice {
  Service({required super.dio});

  @override
  Future<List<TravelModel>?> fetchItems() async {
    var response = await dio.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == HttpStatus.ok) {
      var datas = response.data;
      if (datas is List) {
        return datas.map((e) => TravelModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
