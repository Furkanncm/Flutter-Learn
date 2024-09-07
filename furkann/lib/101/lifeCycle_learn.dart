import 'package:flutter/material.dart';
import 'package:furkann/product/statelesT.dart';

class lifeCycle extends StatefulWidget {
  const lifeCycle({
    super.key,
    required this.message,
  });
  final String message;

  @override
  State<lifeCycle> createState() => _lifeCycleState();
}

class _lifeCycleState extends State<lifeCycle> {
  int data = 0;
  String mmessage = " ";
  late final bool _isOdd;

  @override
  void initState() {
    super.initState();
    mmessage = widget.message;
    _isOdd = widget.message.length.isOdd;
    _custommethod();
    print("aa");
  }

  void _custommethod() {
    if (_isOdd) {
      mmessage += " Kelime Tek";
    } else {
      mmessage += " Kelime Çift ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mmessage)),
      body: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Text(data.toString()),
          const SizedBox(
            height: 250,
          ),
          Center(
              child: _isOdd
                  ? TextButton(onPressed: () {}, child: Text(mmessage))
                  : const States(
                      message: "Furkan",
                    )),
        ],
      ),
    );
  }
}
