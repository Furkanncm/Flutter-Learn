import 'dart:io';

import '../Model/Mobx_Model.dart';
import 'IMobxService.dart';

part 'MobxService_Endpoints.dart';
class Mobxservice extends IMobxService {
  Mobxservice({required super.dio});

  @override
  Future<List<ToDoModel>> fetchItems() async {
    final response = await dio.get(_MobxserviceEndpoints.FACTS.endpoint);
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        var result = datas.map((e) {
          return ToDoModel.fromJson(e);
        }).toList();
        return result;
      }
    }
    return [];
  }
}
