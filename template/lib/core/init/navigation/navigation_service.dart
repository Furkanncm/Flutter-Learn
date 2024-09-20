import 'package:flutter/material.dart';
import 'package:template/core/init/navigation/INavigationService.dart';

class NavigationService extends Inavigationservice {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> globalKey = GlobalKey();

  @override
  Future<void> navigateToPage(String path, Object? object) async {
    await globalKey.currentState?.pushNamed(path, arguments: object??"");
  }
}
