import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_cubit_state.dart';

import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/LoginService.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> globalKey;
  late final TextEditingController mailController;
  late final TextEditingController passwordController;
  late final Iloginservice service;
  late final Dio dio;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    dio = Dio(
      BaseOptions(
        baseUrl: "https://reqres.in/api/",
        contentType: Headers.jsonContentType,
      ),
    );
    service = Loginservice(dio: dio);
  }

  Future<void> login() async {
    LoginModel model = LoginModel(
      email: mailController.text,
      password: passwordController.text,
    );
    var response = await service.login(model);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(response?.token ?? ""),
        ),
      );
    }));
  }

  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : const SizedBox.shrink();
            },
          ),
        ),
        body: Form(
          key: globalKey,
          child: Column(
            children: [
              _TexForm(
                controller: mailController,
                text: "Mail",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return _TexForm(
                    controller: passwordController,
                    text: "Password",
                    isVisible: state.isVisible,
                    validator: (value) {
                      // Şifre en az 6 karakter olmalı
                      if (value == null || value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null; // Hata yoksa null döndür
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          changeVisibility();
                        },
                        icon: state.isVisible
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined)),
                  );
                },
              ),
              _LoginButton(
                  globalKey: globalKey,
                  mailController: mailController,
                  passwordController: passwordController)
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
    required this.globalKey,
    required this.mailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> globalKey;
  final TextEditingController mailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () async {
            if (globalKey.currentState?.validate() ?? false) {
              context
                  .read<LoginCubit>()
                  .checkUser(mailController.text, passwordController.text);
            }
          },
          child: const Text("Login"),
        );
      },
    );
  }
}

class _TexForm extends StatelessWidget {
  const _TexForm({
    super.key,
    required this.controller,
    required this.text,
    this.suffixIcon,
    this.isVisible,
    this.validator,
  });

  final TextEditingController controller;
  final String text;
  final Widget? suffixIcon;
  final bool? isVisible;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: isVisible ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: text,
            labelText: text,
            border: const OutlineInputBorder(),
          )),
    );
  }
}
