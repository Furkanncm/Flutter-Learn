import 'package:flutter/material.dart';
import 'package:furkann/202/Cache/LogInViewModel.dart';
import 'package:furkann/202/Cache/SigIn.dart';
import 'package:furkann/202/MyService/Tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LogInViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              customFormField(
                  validator: (value) {
                    return (value?.isNotEmpty ?? false)
                        ? null
                        : "Please enter a valid email address";
                  },
                  textEditingController: mailController,
                  inputType: inputType,
                  labeltext: mailText,
                  icon: Icon(Icons.mail_outline_outlined)),
              customFormField(
                  isVisible: isPasswordVisible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      changePasswordVisible();
                    },
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                  ),
                  validator: (value) {
                    return ((value!.length > 8) ?? false)
                        ? null
                        : "Password must be at least 8 characters";
                  },
                  textEditingController: PasswordController,
                  inputType: input2Type,
                  labeltext: passwordText,
                  icon: Icon(Icons.lock_outline)),
              ElevatedButton.icon(
                  onPressed: () {
                    if ((globalKey.currentState?.validate() ?? false) &&
                        mailController.text ==
                            sharedPreferences?.getString(mailText) &&
                        PasswordController.text ==
                            sharedPreferences?.getString(passwordText)) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tabbar()));
                    } else {
                      print("Form validation failed");
                    }
                  },
                  icon: Icon(Icons.login),
                  label: Text("Log In")),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return SigInPageView();
                    }));
                  },
                  icon: Icon(Icons.chevron_left),
                  label: Text("Dont Have Account?"))
            ],
          ),
        ),
      ),
    );
  }
}
