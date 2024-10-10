import 'package:flutter/material.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'custom_card.dart';

class AboutmeCard extends StatelessWidget {
  const AboutmeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(text: LocaleKeys.aboutMe, child: Icon(Icons.question_mark_outlined));
  }
}
