import 'package:flutter/material.dart';
import 'package:furkann/firstPage.dart';
import 'package:furkann/core/random_image.dart';

class listTile extends StatelessWidget {
  final String text = "My Card";
  final String subText = "How do you use your Card";

  const listTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {},
              title: textTheme(
                text: text,
                textSize: 20,
              ),
              subtitle: textTheme(
                text: subText,
                textSize: 15,
              ),
              leading: Icon(Icons.money),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
            ),
          ),
          Card(
            child: ListTile(
                onTap: () {},
                title: const randomImage(
                  height: 200,
                )),
          )
        ],
      ),
    );
  }
}

class textTheme extends StatelessWidget {
  final String text;
  final double textSize;
  const textTheme({
    Key? key,
    required this.text,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: Colors.white, fontSize: textSize),
    );
  }
}
