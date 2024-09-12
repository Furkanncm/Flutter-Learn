import 'package:flutter/material.dart';
import '../../303/Lottie_learn.dart';
import '../../303/navigator/Navigate_HomeDetailView.dart';
import '../../303/navigator/Navigate_HomeView.dart';
import 'NavigatorRoutes.dart';

class Navigatorcustom {
  Route<dynamic>? getView(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return getPage(const LottieLearn());
    }

    final routes = routeSettings.name == "/"
        ? NavigatorRouter.init
        : NavigatorRouter.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigatorRouter.init:
        return getPage(const LottieLearn());
      case NavigatorRouter.home:
        return getPage(const NavigateHomeview());
      case NavigatorRouter.detail:
        return getPage(
            const NavigateHomedetailview(
              id: "Kazım",
            ),
            fullscreen: true);

    }
  }

  Route<dynamic>? getPage(Widget child, {bool? fullscreen}) {
    return MaterialPageRoute(
        fullscreenDialog: fullscreen ?? false,
        builder: (context) {
          return child;
        });
  }
}
