import 'package:flutter/material.dart';
import 'package:furkann/202/MyService/getServiceView.dart';
import 'package:furkann/202/MyService/myModel.dart';
import 'package:furkann/202/MyService/service.dart';

abstract class getViewModel extends State<getService>  {
  List<Models>? items;
  bool isLoading = false;
  late final IService manager;

  @override
  void initState() {
    super.initState();
    manager = Service();
    getItems();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getItems() async {
    changeLoading();
    items = await manager.fetchItems();
    changeLoading();
  }

}