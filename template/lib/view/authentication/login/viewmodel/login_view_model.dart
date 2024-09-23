import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_viewmodel.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store implements  BaseViewmodel {
  late BuildContext _buildContext;
  @override
  void setContext(BuildContext context){
    _buildContext = context;
  }
  @override
  void init(){}
}
