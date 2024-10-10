import 'package:flutter/material.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'custom_card.dart';

class MyAccountCard extends StatelessWidget {
  const MyAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      text: LocaleKeys.myAccount,
      suffixChild: Icon(Icons.chevron_right_outlined),
      child: Icon(Icons.person_2_outlined),
    );
  }
}
