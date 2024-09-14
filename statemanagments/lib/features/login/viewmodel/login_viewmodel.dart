import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier {
  bool isChecked = false;
  bool isLoading = false;
  late final TextEditingController mailController;
  late final TextEditingController passwordController;

  LoginViewmodel() {
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }
  void changeCheck(bool value) {
    isChecked = value;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<VoidCallback?> onPressed(String email, String password) async {
    changeLoading();
    await Future.delayed(Duration(seconds: 1));
    changeLoading();
  }
}
