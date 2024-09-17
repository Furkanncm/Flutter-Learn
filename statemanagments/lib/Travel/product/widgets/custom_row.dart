import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../lang/travel_lang.dart';
import '../../features/view/home_view.dart';
import '../../features/viewmodel/travel_viewmodel.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    Key? key,
    required this.viewmodel,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final TravelViewModel viewmodel;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         CustomText(text: text),
        Observer(builder: (_) {
          return TextButton(
              onPressed: onPressed, child: const Text(TravelLang.seeAll));
        })
      ],
    );
  }
}
