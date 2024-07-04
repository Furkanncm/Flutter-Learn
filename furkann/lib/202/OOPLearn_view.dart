import 'package:flutter/material.dart';
import 'package:furkann/202/OOPLearn.dart';

class fileexceptionView extends StatefulWidget {
  const fileexceptionView({super.key});

  @override
  State<fileexceptionView> createState() => _fileexceptionViewState();
}

class _fileexceptionViewState extends State<fileexceptionView> {
  late final IDowloand _dowloand;

  @override
  void initState() {
    super.initState();
    _dowloand = FileDowloand();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _dowloand.dowloandItem(null);
      }),
    );
  }
}
