import 'package:flutter/material.dart';
import 'getServiceView.dart';
import 'myModel.dart';
import 'service.dart';

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