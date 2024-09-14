import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ShoppieBasket/features/tabbar/app_tabbar.dart';
import 'ShoppieBasket/product/manager/shop/shop_manager.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ShopManager>(create: (context) => ShopManager()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
          indicatorColor: Colors.red,
          appBarTheme:
              AppBarTheme(elevation: 0, backgroundColor: Colors.indigo[800]),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo[900])),
      debugShowCheckedModeBanner: false,
      home: const AppTabbar(),
    );
  }
}
