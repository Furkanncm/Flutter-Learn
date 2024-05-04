import 'package:flutter/material.dart';

class randomImage extends StatelessWidget {
  final String imageURL = "https://picsum.photos/id/1/200/300";
  final double height;
  const randomImage({
    Key? key,
    this.height = 100, // if we dont get height parameter then height is 100
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageURL,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
