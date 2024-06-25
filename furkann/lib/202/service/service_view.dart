import 'package:flutter/material.dart';

import 'package:furkann/202/service/service_get_view.dart';
import 'package:furkann/202/service/service_post_view.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView>
    with TickerProviderStateMixin {
  late final TabController _kontroller;

  @override
  void initState() {
    super.initState();
    _kontroller =
        TabController(length: _MyPageRoute.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyPageRoute.values.length,
        child: Scaffold(
          body: TabBarView(
            controller: _kontroller,
            physics: NeverScrollableScrollPhysics(),
            children: [ServiceLearn(), ServicePostModel()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_kontroller.index == 1) {
                _kontroller.animateTo(0);
              } else {
                _kontroller.animateTo(1);
              }
            },
            child: Icon(Icons.swipe),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: TabBar(
                controller: _kontroller,
                tabs: _MyPageRoute.values
                    .map((e) => Tab(
                          text: e.name,
                        ))
                    .toList()),
          ),
        ));
  }
}

enum _MyPageRoute {
  ServiceGet,
  ServicePost,
}
