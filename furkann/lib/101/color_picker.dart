import 'package:flutter/material.dart';

class ColorPick extends StatefulWidget {
  const ColorPick({super.key, required this.initializeColor});
  final Color? initializeColor;

  @override
  State<ColorPick> createState() => _ColorPickState();
}

class _ColorPickState extends State<ColorPick> {
  @override
  void initState() {
    super.initState();
    _background = widget.initializeColor;
  }

  @override
  void didUpdateWidget(covariant ColorPick oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initializeColor != widget.initializeColor &&
        widget.initializeColor != null) {
      setState(() {
        _background = widget.initializeColor;
      });
    }
  }

  Color? _background;
  String colorRed = "Red";
  String colorBlue = "Blue";
  String colorGreen = "Green";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _background,
      bottomNavigationBar:
          BottomNavigationBar(onTap: (value) => {setValue(value)}, items: [
        navigateItem(Colors.red, colorRed),
        navigateItem(Colors.green, colorGreen),
        navigateItem(Colors.blue, colorBlue),
      ]),
    );
  }

  BottomNavigationBarItem navigateItem(Color colorName, String name) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
          child: Container(
            color: colorName,
            height: 20,
          ),
        ),
        label: name);
  }

  void setStateMethod(Color backgroundColor) {
    return setState(() {
      _background = backgroundColor;
    });
  }

  void setValue(int value) {
    if (value == _myColors.red.index) {
      setStateMethod(Colors.red);
    } else if (value == _myColors.green.index) {
      setStateMethod(Colors.green);
    } else if (value == _myColors.blue.index) {
      setStateMethod(Colors.blue);
    }
  }
}

enum _myColors { red, green, blue }
