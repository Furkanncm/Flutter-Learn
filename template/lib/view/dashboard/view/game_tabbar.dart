import 'package:flutter/material.dart';
import '../../../core/constants/app/app_dashboard_items.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/dashboard_extension.dart';

import '../../../core/components/text/normal_board_text.dart';
import '../../../core/constants/enum/dashboard_enum.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../_widget/dashboard_camera_icon_button.dart';
import '../_widget/dashboard_qr_icon_button.dart';

class GameTabbar extends StatefulWidget {
  const GameTabbar({super.key});
  @override
  State<GameTabbar> createState() => _GameTabbarState();
}

class _GameTabbarState extends State<GameTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: DashboardEnum.values.length,
      child: Scaffold(
        appBar: AppBar(
          leading: const DashboardIconButton(),
          title: NormalBoardText(text: LocaleKeys.game, textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold) ?? const TextStyle()),
          actions: const [DashboardCameraIconButton()],
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            // labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            isScrollable: true,
            tabs: DashboardEnum.values.map((e) => Tab(text: e.dashboardName)).toList(),
          ),
        ),
        body: Padding(
          padding: context.paddingLow,
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              ),
              Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: AppDashboardItems.items.map((e) {
                        return e.page;
                      }).toList()))
            ],
          ),
        ),
      ),
    );
  }
}
