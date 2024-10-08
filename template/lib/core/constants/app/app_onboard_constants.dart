import '../../../view/login/view/login_view.dart';
import '../../../view/onboard/model/onboard_model.dart';
import '../../../view/authentication/test/view/test2_view.dart';
import '../../../view/authentication/test/view/test_view.dart';

class AppOnboardConstantsModels {
  static List<OnboardModel> onBoardModels = [
    OnboardModel(
        title: 'Onboard 0',
        path: 'assets/images/onboard/onboard_0.png',
        page: const LoginView()),
    OnboardModel(
        title: 'Onboard 1',
        path: 'assets/images/onboard/onboard_1.png',
        page: const Test2View()),
    OnboardModel(
        title: 'Onboard 2',
        path: 'assets/images/onboard/onboard_2.png',
        page: const TestView()),
  ];
}
