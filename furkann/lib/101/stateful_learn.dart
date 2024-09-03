import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furkann/101/firstPage.dart';
import 'package:furkann/product/helloCountCustom.dart';

class statefull_learn extends StatefulWidget {
  const statefull_learn({super.key});

  @override
  State<statefull_learn> createState() => _statefull_learnState();
}

class _statefull_learnState extends State<statefull_learn> {
  int _countValue = 0;
  @override
  void updateCounter(bool isAdd) {
    if (isAdd) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: textWidget(text: _countValue.toString())),
          const Placeholder(),
          const countCustom()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [add_count(), decrease_count()],
      ),
    );
  }

  FloatingActionButton decrease_count() {
    return FloatingActionButton(
      onPressed: () {
        updateCounter(false);
      },
      child: const Icon(Icons.remove),
    );
  }

  FloatingActionButton add_count() {
    return FloatingActionButton(
      onPressed: () {
        updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }
}
