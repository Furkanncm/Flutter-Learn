import 'package:flutter/material.dart';

class NavigateHomedetailview extends StatefulWidget {
  const NavigateHomedetailview({super.key, this.id});
  final String? id;

  @override
  State<NavigateHomedetailview> createState() => _NavigateHomedetailviewState();
}

class _NavigateHomedetailviewState extends State<NavigateHomedetailview> {
  String? _id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      final modelid = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        _id = modelid is String ? modelid : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(_id ?? ""),
      ),
    );
  }
}
