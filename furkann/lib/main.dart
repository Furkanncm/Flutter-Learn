import 'package:flutter/material.dart';
import 'package:furkann/303/Task/View/Mobx_view.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/view/PostView.dart';
import 'package:furkann/product/global/theme_notifer.dart';
import 'package:furkann/product/navigator/NavigatorCustom.dart';
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
      //     centerTitle: true,P
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
      home: Postview(),
    );
  }
}
