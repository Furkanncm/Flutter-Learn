import 'package:flutter/material.dart';
import '../../../features/service/service.dart';
import '../../../features/view/home_view.dart';

class TravelTabbarModel {
  final String title;
  final Icon icon;
  final Widget page;

  TravelTabbarModel(
      {required this.title, required this.icon, required this.page});
}

class TravelTabbarModelItems {
  static final List<TravelTabbarModel> items = [
    TravelTabbarModel(title: 'Home', icon: Icon(Icons.home), page: HomeView()),
    TravelTabbarModel(
        title: 'Bookmarked',
        icon: Icon(Icons.bookmark_outlined),
        page: Container(
          color: Colors.blueGrey,
        )),
    TravelTabbarModel(
        title: 'Notifications',
        icon: Icon(Icons.notifications),
        page: Container(color: Colors.green)),
    TravelTabbarModel(
        title: 'Profile',
        icon: Icon(Icons.person),
        page: Container(
          color: Colors.black,
        )),
  ];
}
