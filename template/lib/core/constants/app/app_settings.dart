import 'package:flutter/material.dart';
import 'package:template/view/find-friends/view/find_friends_view.dart';
import 'package:template/view/onboard/view/onboard_view.dart';

import '../../../view/settings/model/tabbar_model.dart';
import '../../../view/settings/view/settings_view.dart';
import '../../../view/social-feed/view/feed_home_view.dart';

class AppSettings {
  static final List<SettingsTabbarModel> items = [
    SettingsTabbarModel(icon: const Icon(Icons.home_outlined), page: const SettingsView()),
    SettingsTabbarModel(icon: const Icon(Icons.star_border_outlined), page: const FeedHomeView()),
    SettingsTabbarModel(icon: const Icon(Icons.add_box_outlined), page: const OnboardView()),
    SettingsTabbarModel(icon: const Icon(Icons.dataset_outlined), page: const FindFriendsView()),
  ];
}
