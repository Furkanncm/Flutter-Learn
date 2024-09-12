import 'package:flutter/material.dart';
import '../101/card.dart';
import '../101/mainFood.dart';
import '../101/randomPage.dart';
import 'model_learn.dart';
import '../demos/color_life_cycle.dart';

class tabbar2 extends StatefulWidget {
  const tabbar2({super.key});

  @override
  State<tabbar2> createState() => _tabbar2State();
}

class _tabbar2State extends State<tabbar2> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyPageNames.values.length, vsync: this);

    final furkan = PostModel12(UserId: 1, id: 2, title: "title", body: "body");
    furkan.getbody;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyPageNames.values.length,
        child: Scaffold(
          appBar: AppBar(),
          body: TabBarView(
            controller: _tabController,
            children: const [mainFood(), cardView(), colorLifeCycle(), randPage()],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            if (_tabController.index != 0) {
              _tabController.animateTo(0);
            }
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: TabBar(
                controller: _tabController,
                tabs: _MyPageNames.values
                    .map((e) => Tab(text: e.name, icon: Icon(_getIcon(e))))
                    .toList()),
          ),
        ));
  }
}

// _getIcon fonksiyonu
IconData _getIcon(_MyPageNames pageName) {
  switch (pageName) {
    case _MyPageNames.home:
      return Icons.home;
    case _MyPageNames.favorite:
      return Icons.favorite;
    case _MyPageNames.person:
      return Icons.person;
    case _MyPageNames.settings:
      return Icons.settings;
    default:
      return Icons.error; // Varsayılan bir hata ikonu
  }
}

enum _MyPageNames { home, favorite, person, settings }
