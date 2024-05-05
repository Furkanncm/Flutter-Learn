import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furkann/101/firstPage.dart';
import 'package:furkann/core/random_image.dart';

class foodPage extends StatelessWidget {
  const foodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      "https://picsum.photos/id/75/200/300",
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      left: 40,
                      top: 200,
                      child: Card(
                        child: IconButton(
                            color: Colors.amberAccent,
                            onPressed: () {},
                            icon: Icon(Icons.chevron_left)),
                      )),
                  Positioned(
                      right: 40,
                      top: 200,
                      child: Card(
                        child: IconButton(
                            color: Colors.amberAccent,
                            onPressed: () {},
                            icon: Icon(Icons.chevron_right)),
                      ))
                ],
              )),
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 1,
              child: textWidget(
                text: "WE HAVE SPECIAL FOOD",
              )),
          Spacer(
            flex: 1,
          ),
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent),
                  onPressed: () {},
                  child: buttonText(buttonTextt: "Start Explore"))),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
