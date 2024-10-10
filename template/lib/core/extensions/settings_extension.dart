import '../constants/app/app_settings.dart';
import '../constants/enum/settings_item_enum.dart';
import '../../view/settings/model/tabbar_model.dart';

extension SettingsExtension on SettingsItemEnum {
  SettingsTabbarModel get model {
    switch (this) {
      case SettingsItemEnum.HOME:
        AppSettings.items[0];
      case SettingsItemEnum.STAR:
        AppSettings.items[1];
      case SettingsItemEnum.ADD:
        AppSettings.items[2];
      case SettingsItemEnum.DASHBOARD:
    }
    return AppSettings.items[0];
  }
}
