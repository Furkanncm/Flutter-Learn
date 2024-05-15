import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class States extends StatefulWidget {
  final String message;

  const States({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  String _message = " ";
  @override
  void initState() {
    _message = widget.message;
    super.initState();
  }

  @override
  int data = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            data++;
          });
        },
        child: Text(_message + data.toString()));
  }
}
