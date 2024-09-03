import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furkann/202/Cache/SecureCache.dart';
import 'package:furkann/202/Cache/shared.dart';
import 'package:furkann/202/MySheet.dart';
import 'package:furkann/202/Sheet_learn.dart';
import 'package:furkann/202/tab.dart';
import 'package:furkann/303/Callback_learn.dart';
import 'package:furkann/303/Dropdown.dart';
import 'package:furkann/303/Lottie_learn.dart';
import 'package:furkann/303/ServiceAdvanced/View/restView.dart';
import 'package:furkann/303/TabbarAdvanced.dart';
import 'package:furkann/303/navigator/Navigate_HomeDetailView.dart';
import 'package:furkann/303/navigator/Navigate_HomeView.dart';
import 'package:furkann/303/part/Partof_Learn.dart';
import 'package:furkann/product/global/theme_notifer.dart';
import 'package:furkann/product/navigator/NavigatorCustom.dart';
import 'package:furkann/product/navigator/NavigatorRoutes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifer>(create: (context) {
          return ThemeNotifer();
        })
      ],
      builder: (context, child) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifer>().currentTheme,
      // theme: ThemeData.dark().copyWith(
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color: Colors.red,
      //   ),
      //   cardTheme: CardTheme(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //   ),
      //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //       backgroundColor: Colors.greenAccent),
      //   appBarTheme: const AppBarTheme(
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      //     centerTitle: true,
      //     backgroundColor: Colors.indigo,
      //     elevation: 0,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      // home: const LottieLearn(),
     // routes: Navigatorroutes().items,
      onGenerateRoute: (settings) {
         return Navigatorcustom().getView(settings);

      },
    );
  }
}
