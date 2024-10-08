import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../onboard/view/onboard_view.dart';
import '../../../authentication/test/view/test2_view.dart';
import 'Icubit_login.dart';
import 'cubit_login_state.dart';

class CubitLoginCubit extends Cubit<CubitLoginCubitState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  CubitLoginCubit(this.emailController, this.passwordController, this.formKey)
      : super(CubitLoginCubitInitial());

  bool isValidate = false;
  bool isForgot = false;
  bool isVisible = true;

  void isFormValidate(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      if (emailController.text == "furkan" &&
          passwordController.text == "1234567") {
        isValidate = true;
        emit(CubitLoginValidateState(isValidate: isValidate)); // State güncelle
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardView()),
        );
      } else {
        emit(CubitLoginValidateState(isValidate: false));
      }
    }
  }

  void changeForgotState(BuildContext context) {
    isForgot = true;
    emit(CubitForgotPasswordState(isForgot: isForgot));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const Test2View();
    }));
  }

  void routeRegister(BuildContext context) {
    emit(CubitRegisterState(isRegister: true));
  }

  void changVisibility() {
    isVisible = !isVisible;
    emit(CubitIsVisible(isVisible: isVisible));
  }
}
