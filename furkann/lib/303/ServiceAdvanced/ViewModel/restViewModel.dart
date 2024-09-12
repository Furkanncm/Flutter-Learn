
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Model/restModel.dart';
import '../Service/restService.dart';
import '../View/restView.dart';

abstract class restViewModel extends State<RestView> {
  late final IRestService service;
  final Dio manager =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  List<CompanyUser>? user;

  @override
  void initState() {
    super.initState();
    service = RestService(manager);
    fetchItems();
  }

  Future<void> fetchItems() async {
    user = await service.fetchRestServiceItems();
    setState(() {
      user;
    });
  }
}
