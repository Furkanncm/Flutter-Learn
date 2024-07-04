import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furkann/202/Form_learnd.dart';
import 'package:furkann/202/OOPLearn_view.dart';
import 'package:furkann/202/image_learn_advance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.red,
        ),
        cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TextFormLearn(),
    );
  }
}
