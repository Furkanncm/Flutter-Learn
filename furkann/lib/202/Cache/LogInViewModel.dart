import 'package:flutter/material.dart';
import 'package:furkann/202/Cache/LogIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LogInViewModel extends State<LoginView>{
   late final GlobalKey<FormState> globalKey;
  late final TextEditingController mailController;
  late final TextEditingController PasswordController;
  SharedPreferences? sharedPreferences;
  final String mailText = "Email";
  final String passwordText = "Password";
  final TextInputType inputType = TextInputType.emailAddress;
  final TextInputType input2Type = TextInputType.text;
    bool isPasswordVisible = true;

  void changePasswordVisible() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    PasswordController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    getSharedParams();
  }

  Future<void> getSharedParams() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String? Email = sharedPreferences?.getString(mailText);
    final String? Password = sharedPreferences?.getString(passwordText);
  }
}