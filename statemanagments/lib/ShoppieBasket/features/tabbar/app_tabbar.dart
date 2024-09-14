import 'package:flutter/material.dart';

import 'model/tabbar_model.dart';

class AppTabbar extends StatelessWidget {
  const AppTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TabModelItems.items.length,
        child: Scaffold(
          bottomNavigationBar: _bottomAppbar(),
          body: _tabBarView(),
        ));
  }

  BottomAppBar _bottomAppbar() {
    return BottomAppBar(
      child: TabBar(
          labelColor: Colors.red[600],
          unselectedLabelColor: Colors.blueGrey,
          indicatorColor: Colors.red[600],
          tabs: TabModelItems.items.map((e) {
            return Tab(icon: e.icon, text: e.title);
          }).toList()),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      children: TabModelItems.items.map((e) => e.page).toList(),
    );
  }
}
