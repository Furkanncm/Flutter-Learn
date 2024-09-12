import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'SigIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SigInViewModel extends State<SigInPageView> {
  late final TextEditingController mailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> globalKey;
  SharedPreferences? sharedPreferences;
  final String labelMail = "Email";
  final String labelPassword = "Password";
  final String labelTitle = "Sign In";
  final String labelPasswordAlert = "Password must be at least 8 characters";
  final String labelMailAlert = "Please enter a valid email address";
  final String labelMailEmpty = "Already Have Account?";
  bool isPasswordVisible = true;

  void changePasswordVisible() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<void> checkCondition(BuildContext context) async {
    if (globalKey.currentState?.validate() ?? false) {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences?.setString(labelMail, mailController.text);
      await sharedPreferences?.setString(
          labelPassword, passwordController.text);
      
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    } else {
      print("Form validation failed");
    }
  }

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey<FormState>();
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
