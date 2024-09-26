import 'package:flutter/widgets.dart';

class OnboardModel {
  final String title;
  final String path;
  final Widget page;

  OnboardModel({
    required this.title,
    required this.path,
    required this.page,
  });
}
