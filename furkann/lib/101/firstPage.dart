// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class firstPage extends StatelessWidget {
  const firstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 200,
              child: ImageView(name: ProjectImage().image),
            ),
            Padding(
              padding: pagePadding.paddingFromRight,
              child: const ProjectHeadline(headline: "Create Your First Note"),
            ),
            Padding(
              padding:
                  pagePadding.paddingSymmetric + pagePadding.paddingFromLeft,
              child: const textWidget(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, .",
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                    padding: pagePadding.paddingSymmetric,
                    child: buttonText(buttonTextt: "Create A Note ")),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                )),
            TextButton(onPressed: () {}, child: const textWidget(text: "Skip")),
          ],
        ),
      ),
      drawer: const Drawer(
        child: Center(child: Text("data")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.lock_clock),
          label: 'Zamanlayıcı',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: " ",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ayarlar',
          backgroundColor: Colors.purple,
        ),
      ]),
    );
  }
}

class textWidget extends StatelessWidget {
  const textWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color.fromARGB(255, 221, 187, 137),
            fontSize: 16,
          ),
    );
  }
}

class pagePadding {
  static final paddingFromRight = EdgeInsets.only(right: 15);
  static final paddingFromLeft = EdgeInsets.only(left: 15);
  static final paddingSymmetric =
      EdgeInsets.symmetric(horizontal: 1, vertical: 15);
  static final paddingTop = EdgeInsets.only(top: 0);
}

class ProjectHeadline extends StatelessWidget {
  const ProjectHeadline({super.key, required this.headline});
  final String headline;
  @override
  Widget build(BuildContext context) {
    return Text(headline,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ));
  }
}

class buttonText extends StatelessWidget {
  const buttonText({super.key, required this.buttonTextt});
  final String buttonTextt;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonTextt,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 16,
          ),
    );
  }
}

class ProjectImage {
  final String image = "indir";
}

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "asset/$name.png",
      fit: BoxFit.none,
    );
  }
}
