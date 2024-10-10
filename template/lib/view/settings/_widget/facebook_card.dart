import 'package:flutter/material.dart';
import 'custom_card.dart';

import '../../../core/init/language/locale_keys.g.dart';

// ignore: must_be_immutable
class FacebookCard extends StatelessWidget {
  FacebookCard({super.key});

  bool values = false;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        text: LocaleKeys.facebook,
        suffixChild: Switch(
            value: values,
            onChanged: (bool value) {
              //TODO:
            }),
        child: const Icon(Icons.facebook, color: Colors.blue));
  }
}
