import 'package:flutter/material.dart';

import 'features/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              elevation: 0,
              shape: const StadiumBorder(),
              backgroundColor: Colors.indigo[800]),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo[900])),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
