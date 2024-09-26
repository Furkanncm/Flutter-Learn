import 'package:flutter/material.dart';
import 'package:template/view/authentication/login/view/login_view.dart';
import 'package:template/view/authentication/onboard/model/onboard_model.dart';
import 'package:template/view/authentication/test/view/test2_view.dart';
import 'package:template/view/authentication/test/view/test_view.dart';

class AppOnboardConstantsModels {
  static List<OnboardModel> onBoardModels = [
    OnboardModel(
        title: 'Onboard 0',
        path: 'assets/images/onboard/onboard_0.png',
        page: LoginView()),
    OnboardModel(
        title: 'Onboard 1',
        path: 'assets/images/onboard/onboard_1.png',
        page: Test2View()),
    OnboardModel(
        title: 'Onboard 2',
        path: 'assets/images/onboard/onboard_2.png',
        page: TestView()),
  ];
}
