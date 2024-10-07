import 'package:flutter/material.dart';

class CardModel {
  final Widget? image;
  final CircleAvatar avatar;
  final DateTime dateTime;
  final String name;
  final String title;
  final String description;
  bool isLiked;

  CardModel(this.image,
      {required this.avatar,
      required this.dateTime,
      required this.name,
      required this.title,
      required this.description,
      required this.isLiked});
}
