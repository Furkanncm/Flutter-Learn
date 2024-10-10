import 'package:flutter/material.dart';

import '../../../view/social-feed/model/tabbar_model.dart';
import '../../../view/social-feed/view/feed_home_view.dart';

class AppFeedTabbar {
  static final List<TabbarModel> feedTabbarItems = [
    TabbarModel(icon: const Icon(Icons.home), page: const FeedHomeView()),
    TabbarModel(icon: const Icon(Icons.file_copy_outlined), page: Container()),
    TabbarModel(
        icon: const Icon(Icons.notifications_none_outlined), page: Container()),
    TabbarModel(icon: const Icon(Icons.person_2_outlined), page: Container()),
  ];
}
