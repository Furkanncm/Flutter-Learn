import 'Icubit_login.dart';

class CubitLoginCubitInitial extends CubitLoginCubitState {}

class CubitLoginValidateState extends CubitLoginCubitState {
  final bool isValidate;

  CubitLoginValidateState({required this.isValidate});
}

class CubitForgotPasswordState extends CubitLoginCubitState {
  final bool isForgot;

  CubitForgotPasswordState({required this.isForgot});
}

class CubitRegisterState extends CubitLoginCubitState {
  final bool isRegister;

  CubitRegisterState({required this.isRegister});
}

class CubitIsVisible extends CubitLoginCubitState {
  final bool isVisible;

  CubitIsVisible({required this.isVisible});
}
