import 'package:flutter/material.dart';
import '../../init/language/locale_keys.g.dart';

import '../../../view/dashboard/model/dashboard.dart';
import '../../../view/dashboard/view/dashboard_view.dart';

class AppDashboardItems {
  static final List<Dashboard> items = [
    Dashboard(title: LocaleKeys.dashboard, page: const DashboardView()),
    Dashboard(title: LocaleKeys.simulation, page: Container()),
    Dashboard(title: LocaleKeys.casual, page: Container()),
    Dashboard(title: LocaleKeys.cartoony, page: Container()),
    Dashboard(title: LocaleKeys.trailing, page: Container()),
  ];
}
