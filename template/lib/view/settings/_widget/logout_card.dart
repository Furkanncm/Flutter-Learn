import 'package:flutter/material.dart';

import '../../../core/init/language/locale_keys.g.dart';
import 'custom_card.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(text: LocaleKeys.logOut, child: Icon(Icons.logout_outlined));
  }
}
