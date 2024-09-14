import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/login/viewmodel/login_viewmodel.dart';

import '../padding/page_padding.dart';
import '../utility/input_decoration.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});
  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final String emailText = "Email Address";
  final String passwordText = "Password";
  bool isVisible = true;
  late final GlobalKey<FormState> _key;
  late final LoginViewmodel _loginViewmodel;
  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _loginViewmodel=LoginViewmodel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewmodel,
      child: Form(
          key: _key,
          child: Column(
            children: [
              _TextFormField(
                controller:context.read<LoginViewmodel>().mailController,
                text: emailText,
                prefixIcon: const Icon(Icons.mail_outline_outlined),
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Email must not be empty";
                  }
                  return null;
                },
              ),
              _TextFormField(
                controller: context.read<LoginViewmodel>().passwordController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty || p0.length < 3) {
                      return "Password must be at least 3";
                    }
                    return null;
                  },
                  isVisible: isVisible,
                  text: passwordText,
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: isVisible
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined))),
            ],
          )),
    );
  }
}

class _TextFormField extends StatelessWidget {
  final String text;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final bool? isVisible;
  String? Function(String?)? validator;
  final TextEditingController? controller;
  _TextFormField({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.suffixIcon,
    this.isVisible,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.bottom(),
      child: TextFormField(
        controller: controller,
          obscureText: isVisible ?? false,
          decoration: ProjectInput(text, prefixIcon, suffixIcon)),
    );
  }
}
