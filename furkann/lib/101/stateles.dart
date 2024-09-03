// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class  statelessLearn extends StatelessWidget {
  const statelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _customColumn(),
    );
  }
}

class _customColumn extends StatelessWidget {
  const _customColumn();

  @override
  Widget build(BuildContext context) {
   const  String name = "furkan";
    const String name2 = "betül";
    return  Column(
      children: [
        const  textWidget(name: name),
        _whiteSpace(),
         const textWidget(name: name2),
        _whiteSpace(),
      ],
    );
  }

  Container _whiteSpace() => Container(height: 20,width: 500,color: Colors.white,);

  
}

class textWidget extends StatelessWidget {
  const textWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
