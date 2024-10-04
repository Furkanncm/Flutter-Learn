import 'package:template/view/product/advanceLogin/cubit/Icubit_login.dart';

class CubitLoginCubitInitial extends CubitLoginCubitState {}

class CubitLoginValidateState extends CubitLoginCubitState {
  final bool isValidate;

  CubitLoginValidateState({required this.isValidate});
}
