import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furkann/product/language/language_items.dart';

class countCustom extends StatefulWidget {
  const countCustom({super.key});

  @override
  State<countCustom> createState() => countCustomState();
}

class countCustomState extends State<countCustom> {
  int _helloCounter = 0;
  final String _welcomeTitle = LanguageItems.WelcomeTitle;
  void _incrementCounter() {
    setState(() {
      _helloCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          shadowColor: Colors.red,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          _incrementCounter();
        },
        child: Text("$_welcomeTitle $_helloCounter "));
  }
}
