import 'dart:io';
import 'package:dio/dio.dart';
import '../Model/restModel.dart';

abstract class IRestService {
  final Dio dio;

  IRestService(this.dio);

  Future<List<CompanyUser>?> fetchRestServiceItems();
}

class RestService extends IRestService {
  RestService(super.dio);

  @override
  Future<List<CompanyUser>?> fetchRestServiceItems() async {
    var response = await dio.get(RestServicePaths.users.name);

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        return datas.map((json) => CompanyUser.fromJson(json)).toList();
         
      }
    }
    return null;
  }
}

enum RestServicePaths { users }
