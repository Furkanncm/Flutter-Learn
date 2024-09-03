import 'package:flutter/material.dart';
import 'package:furkann/product/navigator/NavigatorRoutes.dart';


class NavigateHomeview extends StatefulWidget {
  const NavigateHomeview({super.key});

  @override
  State<NavigateHomeview> createState() => _NavigateHomeviewState();
}
class _NavigateHomeviewState extends State<NavigateHomeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed(NavigatorRouter.detail.addSlash,arguments: "Furkan");
      }),
    );
  }
}
