import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/navigation/navigaton_route.dart';
import 'core/init/theme/light/app_theme_light.dart';
import 'view/food/view/food_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.LANG_ASSET_PATH,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeLight.instance.themeData,
      // home: LocaleManager.instance.getBoolValue(PreferencesEnum.SKIP)
      //     ? const LoginView()
      //     : const LiveLifeOnboardView(),
      home: const FoodView(), debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.globalKey,
      onGenerateRoute: NavigatonRoute.instance.onRoutes,
    );
  }
}
