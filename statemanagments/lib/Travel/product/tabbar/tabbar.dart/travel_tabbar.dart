import 'package:flutter/material.dart';
import '../model/tabbar_model.dart';

class TravelTabbar extends StatefulWidget {
  const TravelTabbar({super.key});
  @override
  State<TravelTabbar> createState() => _TravelTabbarState();
}

class _TravelTabbarState extends State<TravelTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TravelTabbarModelItems.items.length,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar(),
        body: _tabBarView(),
      ),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: TravelTabbarModelItems.items.map((e) => e.page).toList(),
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      child: TabBar(
          tabs: TravelTabbarModelItems.items.map((e) {
        return Tab(
          icon: e.icon,
          text: e.title,
        );
      }).toList()),
    );
  }
}
