import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../product/padding/page_padding.dart';
import '../../../product/widgets/login_Form.dart';
import '../../Lottie/LottiePath.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewmodel _loginViewmodel;
  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  void initState() {
    super.initState();
    _loginViewmodel = LoginViewmodel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewmodel,
      child: _bodyView(context),
    );
  }

  Widget _bodyView(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            children: [
              _animatedLottie(context),
              const FormView(),
              _loginButton(loginViewmodel: _loginViewmodel),
              _checkBoxListTile()
            ],
          ),
        ),
      ),
    );
  }

  Consumer<LoginViewmodel> _checkBoxListTile() {
    return Consumer<LoginViewmodel>(
              builder: (context, loginViewmodel, child) {
                return CheckboxListTile.adaptive(
                  value: loginViewmodel.isChecked,
                  onChanged: (value) {
                    loginViewmodel.changeCheck(value ?? false);
                  },
                  title: const Text("Remember Me"),
                );
              },
            );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Consumer<LoginViewmodel>(
        builder: (context, loginViewmodel, child) {
          return Center(
              child: loginViewmodel.isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : const SizedBox.shrink());
        },
      ),
    );
  }

  AnimatedOpacity _animatedLottie(BuildContext context) {
    return AnimatedOpacity(
      opacity: isKeyboardVisible(context) ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isKeyboardVisible(context)
            ? 0
            : MediaQuery.of(context).size.height * 0.35,
        child: Lottie.asset(
          LottiePath.Lottie_Login.lottiePath,
        ),
      ),
    );
  }
}

class _loginButton extends StatelessWidget {
  final LoginViewmodel loginViewmodel;
  const _loginButton({
    required this.loginViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: loginViewmodel,
      child: ElevatedButton(
        onPressed: () {
          loginViewmodel.onPressed(
            loginViewmodel.mailController.text,
            loginViewmodel.passwordController.text,
          );
        },
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
