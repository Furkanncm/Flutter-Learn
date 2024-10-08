import 'package:flutter/material.dart';

import '../../../core/init/language/locale_keys.g.dart';
import '../_widget/row_cards.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with TickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  controller.animateTo(value);
                },
                controller: PageController(viewportFraction: 0.9),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const Padding(padding: EdgeInsets.all(8.0), child: Placeholder());
                }),
          ),
          TabPageSelector(controller: controller, color: Theme.of(context).primaryColor, selectedColor: Theme.of(context).primaryColor.withOpacity(0.2)),
          const RowCards(text: LocaleKeys.update),
          const RowCards(text: LocaleKeys.popular),
        ],
      ),
    );
  }
}
