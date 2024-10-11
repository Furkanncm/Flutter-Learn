import 'package:flutter/material.dart';

import '../_product/enum/tabbar_enum.dart';
class FoodTabbarView extends StatefulWidget {
const FoodTabbarView({super.key});
@override
  State<FoodTabbarView> createState() => _FoodTabbarViewState();
}
class _FoodTabbarViewState extends State<FoodTabbarView> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: FoodTabbarEnum.values.length,
      child: Scaffold(
        ),
    );
  }
}