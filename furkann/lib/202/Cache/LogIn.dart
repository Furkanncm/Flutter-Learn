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
        title: const Text("Log In"),
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
                  icon: const Icon(Icons.mail_outline_outlined)),
              customFormField(
                  isVisible: isPasswordVisible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      changePasswordVisible();
                    },
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  validator: (value) {
                    return ((value!.length > 8) ?? false)
                        ? null
                        : "Password must be at least 8 characters";
                  },
                  textEditingController: PasswordController,
                  inputType: input2Type,
                  labeltext: passwordText,
                  icon: const Icon(Icons.lock_outline)),
              ElevatedButton.icon(
                  onPressed: () {
                    if ((globalKey.currentState?.validate() ?? false) &&
                        mailController.text ==
                            sharedPreferences?.getString(mailText) &&
                        PasswordController.text ==
                            sharedPreferences?.getString(passwordText)) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Tabbar()));
                    } else {
                      print("Form validation failed");
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Log In")),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const SigInPageView();
                    }));
                  },
                  icon: const Icon(Icons.chevron_left),
                  label: const Text("Dont Have Account?"))
            ],
          ),
        ),
      ),
    );
  }
}
