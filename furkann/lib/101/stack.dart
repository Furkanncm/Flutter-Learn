import 'package:flutter/material.dart';

class stackLearn extends StatelessWidget {
  const stackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Colors.blueGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 200,
              color: Colors.yellowAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              height: 200,
              color: Colors.greenAccent,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 150,
              height: 200,
              child: Container(
                color: Colors.pink,
              ))
        ],
      ),
    );
  }
}
