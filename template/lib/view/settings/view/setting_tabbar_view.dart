import 'package:flutter/material.dart';

import '../../../core/constants/app/app_settings.dart';
import '../../../core/constants/enum/settings_item_enum.dart';

class SettingTabbarView extends StatefulWidget {
  const SettingTabbarView({super.key});
  @override
  State<SettingTabbarView> createState() => _SettingTabbarViewState();
}

class _SettingTabbarViewState extends State<SettingTabbarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: SettingsItemEnum.values.length,
        child: Scaffold(
          body: TabBarView(children: AppSettings.items.map((e) => e.page).toList()),
          bottomNavigationBar: BottomAppBar(
            child: TabBar(physics: const NeverScrollableScrollPhysics(), indicator: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))), indicatorColor: Colors.red, labelColor: Colors.blueGrey[800], unselectedLabelColor: Colors.grey.withOpacity(0.3), tabs: AppSettings.items.map((e) => Tab(icon: e.icon)).toList()),
          ),
        ));
  }
}
