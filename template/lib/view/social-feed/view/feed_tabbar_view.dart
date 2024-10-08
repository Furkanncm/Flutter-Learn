import 'package:flutter/material.dart';
import '../../../core/constants/app/app_feed_tabbar.dart';

class FeedTabbarView extends StatelessWidget {
  const FeedTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: AppFeedTabbar.feedTabbarItems.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: TabBar(
                tabs:
                    AppFeedTabbar.feedTabbarItems.map((e) => e.icon).toList()),
          ),
          body: TabBarView(
              children:
                  AppFeedTabbar.feedTabbarItems.map((e) => e.page).toList()),
        ));
  }
}
