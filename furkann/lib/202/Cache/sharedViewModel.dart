import 'package:flutter/material.dart';
import 'package:furkann/202/Cache/shared.dart';
import 'package:furkann/202/Cache/sharedManager.dart';


abstract class SharedViewModel extends State<SharedView> {
  late final TextEditingController editingController;
  late final TextEditingController numberController;
  late final TextEditingController controller;
  late final SharedManager sharedManager;
  String? action;
  int? number;
  String? text;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController();
    numberController = TextEditingController();
    controller = TextEditingController();
    sharedManager = SharedManager();
    init();
  }

  Future<void> init() async {
    changeLoading();
    await sharedManager.init();
    await getItems();
    changeLoading();
  }

  Future<void> getItems() async {
    action = sharedManager.getString(SharedKeys.action);
    number = sharedManager.getInt(SharedKeys.number);
    text = sharedManager.getString(SharedKeys.input);
    changeTitle(action ?? "Nothing");
    changeBody(number ?? 0);
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changeTitle(String value) {
    setState(() {
      action = value;
    });
  }

  void changeText(String value) {
    setState(() {
      text = value;
    });
  }

  void changeBody(int value) {
    setState(() {
      number = value;
    });
  }
}
