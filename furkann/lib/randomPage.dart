import 'package:flutter/material.dart';

class randPage extends StatelessWidget {
  const randPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
        padding: pagePadding.yatay,
        child: Column(),
      ),
    );
  }
}

class pagePadding {
  static final EdgeInsets yatay = const EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets dikey = const EdgeInsets.symmetric(vertical: 10);
}
