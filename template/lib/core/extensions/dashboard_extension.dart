import 'package:template/core/constants/enum/dashboard_enum.dart';

extension DashboardExtension on DashboardEnum {
  String get dashboardName {
    switch (this) {
      case DashboardEnum.DASHBOARD:
        return 'Dashboard';
      case DashboardEnum.SIMULATION:
        return 'Simulation';
      case DashboardEnum.CASUAL:
        return 'Casual';
      case DashboardEnum.CARTOONY:
        return 'Cartoony';
      case DashboardEnum.TRAILING:
        return 'Trailing';
    }
  }
}
