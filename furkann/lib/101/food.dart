import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furkann/101/firstPage.dart';
import 'package:furkann/101/mainFood.dart';


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
                  const Positioned(
                      left: 40,
                      top: 150,
                      child: Card(
                        child: customIconButton(
                          icon: Icon(Icons.chevron_left),
                        ),
                      )),
                  const Positioned(
                      right: 40,
                      top: 150,
                      child: Card(
                        child: customIconButton(
                          icon: Icon(Icons.chevron_right),
                        ),
                      ))
                ],
              )),
          const Spacer(
            flex: 1,
          ),
          const Expanded(
              flex: 1,
              child: textWidget(
                text: "WE HAVE SPECIAL FOOD",
              )),
          const Spacer(
            flex: 1,
          ),
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mainFood()));
                  },
                  child: const buttonText(buttonTextt: "Start Explore"))),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}

class customIconButton extends StatelessWidget {
  final Icon icon;
  const customIconButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(color: Colors.amberAccent, onPressed: () {}, icon: icon);
  }
}
