import 'package:flutter/material.dart';
import 'package:template/view/settings/_widget/custom_card.dart';

import '../../../core/init/language/locale_keys.g.dart';

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
