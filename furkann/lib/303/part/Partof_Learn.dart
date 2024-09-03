import 'package:flutter/material.dart';
part 'ProjectAppBar.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _ProjectAppBar(), // const ekledim
    );
  }
}
