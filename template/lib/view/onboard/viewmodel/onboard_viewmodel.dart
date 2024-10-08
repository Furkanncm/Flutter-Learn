import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/viewmodel/base_viewmodel.dart';
import '../../../core/constants/app/app_onboard_constants.dart';
import '../model/onboard_model.dart';

part 'onboard_viewmodel.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store implements BaseViewmodel {
  late BuildContext _buildContext;
  @override
  void init() {
    onBoardModels = AppOnboardConstantsModels.onBoardModels;
  }

  @override
  void setContext(BuildContext context) {
    _buildContext = context;
  }

  List<OnboardModel> onBoardModels = [];

  @observable
  int currentIndex = 0;

  @action
  void changePage(int value) {
    currentIndex = value;
  }
}
