import 'package:flutter/material.dart';

class listviewLearn extends StatefulWidget {
  const listviewLearn({super.key});

  @override
  State<listviewLearn> createState() => _listviewLearnState();
}

class _listviewLearnState extends State<listviewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("List Item $index"),
              subtitle: Text("List Item $index"),
              leading: const Icon(Icons.ac_unit),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            );
          },
          separatorBuilder: (context, count) { // what would you do when created every item?
            return const Divider();
          },
          itemCount: 15),
    );
  }
}
