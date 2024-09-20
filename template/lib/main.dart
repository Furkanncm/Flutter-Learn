import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/navigation/navigaton_route.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/notifier/application_provider.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/authentication/test/view/test2_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.LANG_ASSET_PATH,
      child: MultiProvider(
        providers: [...ApplicationProvider.instance.changeNotifier],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value.currentTheme,
          home: const Test2View(),
          navigatorKey: NavigationService.instance.globalKey,
          onGenerateRoute: NavigatonRoute.instance.onRoutes,
        );
      },
    );
  }
}
