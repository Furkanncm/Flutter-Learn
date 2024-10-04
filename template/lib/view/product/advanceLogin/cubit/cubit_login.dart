import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/view/product/advanceLogin/cubit/Icubit_login.dart';
import 'package:template/view/product/advanceLogin/cubit/cubit_login_state.dart';

class CubitLoginCubit extends Cubit<CubitLoginCubitState> {
  CubitLoginCubit() : super(CubitLoginCubitInitial());

  bool isValidate = false;

  void name(params) {
    
  }
}
