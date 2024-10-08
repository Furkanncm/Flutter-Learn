import 'package:flutter/material.dart';
import '../101/card.dart';
import '../101/pageView_learn.dart';
import '../101/randomPage.dart';

class TabbarAdvanced extends StatefulWidget {
  const TabbarAdvanced({super.key});

  @override
  State<TabbarAdvanced> createState() => _TabbarAdvancedState();
}

class _TabbarAdvancedState extends State<TabbarAdvanced>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _MyPages.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyPages.values.length,
        child: Scaffold(
            // appBar: AppBar(),
            body: TabBarView(
                controller: _controller,
                children: const [cardView(), randPage(), pageView()]),
            floatingActionButton: FloatingActionButton(onPressed: () {
              if (_controller.index != 1) {
                _controller.animateTo(1);
              }
            }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: TabBar(
                  controller: _controller,
                  tabs: _MyPages.values
                      .map((e) => Tab(
                            text: e.name,
                          ))
                      .toList(),
                ))));
  }
}

enum _MyPages { ImageView, ServiceView, DropdownView }
