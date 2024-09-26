import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/core/init/language/language_manager.dart';

import 'core/constants/application_constants.dart';
import 'feature/login/view/login_view.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        path: ApplicationConstants.languagePath,
        supportedLocales: LanguageManager.instance.supportedLocales,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LoginView(),
    );
  }
}
