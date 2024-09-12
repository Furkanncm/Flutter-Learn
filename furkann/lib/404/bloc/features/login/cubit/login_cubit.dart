import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> checkUser(String email, String password) async {
    emit(const LoginState(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(const LoginState(isLoading: false));
  }

  // void changeVisible() {
  //   emit(const LoginState(isVisible: ));
  // }
}
