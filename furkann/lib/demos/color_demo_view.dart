import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class colorDemos extends StatefulWidget {
  const colorDemos({super.key});

  @override
  State<colorDemos> createState() => _colorDemosState();
}

class _colorDemosState extends State<colorDemos> {
  Color _backgroundcolor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundcolor,
      body: Column(
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _customOnTap,
          items: [
            BottomNavigationBarItem(
                label: "BlueGrey", icon: Icon(Icons.colorize)),
            BottomNavigationBarItem(
                label: "AmberAccent", icon: Icon(Icons.color_lens)),
            BottomNavigationBarItem(
                label: "Purple", icon: Icon(Icons.color_lens_outlined))
          ]),
    );
  }

  void _customOnTap(value) {
          setState(() {
            if (value == _MyColors.BlueGrey.index) {
              _backgroundcolor = Colors.blueGrey;
            } else if (value == _MyColors.AmberAccent.index) {
              _backgroundcolor = Colors.amberAccent;
            } else if (value == _MyColors.Purple.index) {
              _backgroundcolor = Colors.purple;
            } else {
              _backgroundcolor = Colors.transparent;
            }
          });
        }
}

enum _MyColors { BlueGrey, AmberAccent, Purple }
