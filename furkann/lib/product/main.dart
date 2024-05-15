// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furkann/101/appBar.dart';
import 'package:furkann/101/button.dart';
import 'package:furkann/101/card.dart';
import 'package:furkann/101/custom_widget.dart';
import 'package:furkann/101/food.dart';
import 'package:furkann/101/lifeCycle_learn.dart';
import 'package:furkann/101/mainFood.dart';
import 'package:furkann/101/pageView_learn.dart';
import 'package:furkann/101/stateful_learn.dart';
import 'package:furkann/demos/stack_demo_view.dart';
import 'package:furkann/101/firstPage.dart';
import 'package:furkann/101/listTile.dart';
import 'package:furkann/101/randomPage.dart';
import 'package:furkann/101/row_and_column.dart';
import 'package:furkann/101/stack.dart';
import 'package:furkann/101/stateles.dart';

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
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: lifeCycle(
        message: "Furkan",
      ),
    );
  }
}
