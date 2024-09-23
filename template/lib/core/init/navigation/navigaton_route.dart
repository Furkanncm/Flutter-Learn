import 'package:flutter/material.dart';
import '../../../view/authentication/test/view/test2_view.dart';

class NavigatonRoute {
  static final NavigatonRoute _instance = NavigatonRoute._init();
  static NavigatonRoute get instance => _instance;

  NavigatonRoute._init();

  Route<dynamic> onRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/HOME":
        return MaterialPageRoute(builder: (context) {
          return const Test2View();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
          );
        });
    }
  }
}
