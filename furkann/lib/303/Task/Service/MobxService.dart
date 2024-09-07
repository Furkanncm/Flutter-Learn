import 'dart:io';

import 'package:furkann/303/Task/Model/Mobx_Model.dart';
import 'package:furkann/303/Task/Service/IMobxService.dart';

part 'MobxService_Endpoints.dart';
class Mobxservice extends IMobxService {
  Mobxservice({required super.dio});

  @override
  Future<List<ToDoModel>> fetchItems() async {
    final response = await dio.get(_MobxserviceEndpoints.FACTS.endpoint);
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        var result = _datas.map((e) {
          return ToDoModel.fromJson(e);
        }).toList();
        return result;
      }
    }
    return [];
  }
}
