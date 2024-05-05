// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
//import 'package:furkann/text_learn.dart';


class container_sizedbox extends StatelessWidget{
  const container_sizedbox({super.key});

  @override

  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(),
    body:  Column(
      children: [
         const SizedBox(

          width: 200,
          height: 200,
          child: Text("asdadadadadadad"),
        ),
        const  SizedBox.square(dimension: 50,
        child: Text("aosndıahsnahonhoanahonhaos"),
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),


      ],
    ),
  );
  }

}
