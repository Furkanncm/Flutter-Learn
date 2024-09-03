// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class appBarView extends StatelessWidget {
  appBarView({super.key});
  final String _title = "Welcome";
  final iconProp _iconSize = iconProp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
        ],
        actionsIconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            iconSize: _iconSize.iconSmall,
            color: _iconSize.Froly,
          )
        ],
      ),
    );
  }
}

class iconProp {
  final double iconSmall = 40;
  final Color Froly = const Color(0xffED617A);
}
