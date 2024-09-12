import 'package:flutter/material.dart';
import '../core/random_image.dart';
import '../101/listTile.dart';

class stackDemo extends StatelessWidget {
  const stackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                const Positioned.fill(child: randomImage()),
                Positioned(
                    left: 0,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ))),
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 350,  
                  child: Card(
                    child:
                        ListTile(title: textTheme(text: "Hello", textSize: 20)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.blueGrey,
              ))
        ],
      ),
    );
  }
}
