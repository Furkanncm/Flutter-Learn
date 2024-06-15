import 'package:flutter/material.dart';
import 'package:furkann/101/color_picker.dart';

class colorLifeCycle extends StatefulWidget {
  const colorLifeCycle({super.key});

  @override
  State<colorLifeCycle> createState() => _colorLifeCycleState();
}

class _colorLifeCycleState extends State<colorLifeCycle> {
  @override

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          
        }, icon: Icon(Icons.dangerous_outlined))
      ]),
      body: Column(
        children: [
          Spacer(),
          Expanded(
              child: ColorPick(
            initializeColor: Colors.amberAccent,
          ))
        ],
      ),
    );
  }
}
