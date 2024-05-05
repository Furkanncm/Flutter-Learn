import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furkann/101/appBar.dart';
import 'package:furkann/core/random_image.dart';
import 'package:furkann/101/firstPage.dart';

class rowAndColumn extends StatelessWidget {
  const rowAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: randomImage()),
                  Expanded(child: randomImage()),
                  Expanded(child: randomImage()),
                  Expanded(child: randomImage()),
                ],
              ),
            ),
            const Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textWidget(text: "login"),
                    textWidget(text: "log out"),
                    textWidget(text: "bla bla")
                  ],
                )),
            Expanded(
              flex: 2,
              child: Container(
                color: Color.fromARGB(255, 16, 50, 162),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color.fromARGB(255, 147, 0, 93),
              ),
            )
          ],
        ),
      ),
    );
  }
}
