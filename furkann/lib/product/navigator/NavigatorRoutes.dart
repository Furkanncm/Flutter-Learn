import '../../303/Lottie_learn.dart';
import '../../303/navigator/Navigate_HomeDetailView.dart';
import '../../303/navigator/Navigate_HomeView.dart';

class Navigatorroutes {
  final items = {
    "/": (context) => const LottieLearn(),
    NavigatorRouter.home.addSlash: (context) => const NavigateHomeview(),
    NavigatorRouter.detail.addSlash: (context) => const NavigateHomedetailview(id: "Kazım",),

  };
}

enum NavigatorRouter { init, home, detail}

extension NavigatorRouterExtension on NavigatorRouter {
  String get addSlash => "/$name";
}
