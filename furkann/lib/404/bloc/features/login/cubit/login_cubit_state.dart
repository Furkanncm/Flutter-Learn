import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  final bool isLoading;
  final bool isVisible;
     const LoginState({
     this.isLoading=false,
     this.isVisible=true
  });

  
  @override
  List<Object?> get props => [isLoading,isVisible];


}
