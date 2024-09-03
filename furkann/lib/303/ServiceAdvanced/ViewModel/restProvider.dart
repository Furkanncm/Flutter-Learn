import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furkann/303/ServiceAdvanced/Model/restModel.dart';
import 'package:furkann/303/ServiceAdvanced/Service/restService.dart';

class RestProvider extends ChangeNotifier {
  final IRestService service;
  final Dio manager =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  List<CompanyUser> user = [];
  bool isLoading = false;

  RestProvider(this.service) {
    fetchItems();
  }
  

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchItems() async {
    _changeLoading();
    user = await (service.fetchRestServiceItems()) ?? [];
    _changeLoading();
  }
}
