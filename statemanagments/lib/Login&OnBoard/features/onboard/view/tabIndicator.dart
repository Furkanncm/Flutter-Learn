import 'package:flutter/material.dart';

import '../model/on_board_model.dart';

class Tabindicator extends StatefulWidget {
  Tabindicator({super.key, required this.currentPage});
  int currentPage;

  @override
  State<Tabindicator> createState() => _TabindicatorState();
}

class _TabindicatorState extends State<Tabindicator>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void didUpdateWidget(covariant Tabindicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage) {
      _tabController.animateTo(widget.currentPage);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: DummyModels.onBoardModel.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
      color: Colors.indigo[200],
      selectedColor: Colors.indigo[800],
    );
  }
}
