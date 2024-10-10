import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'custom_card.dart';
import '../model/user_model.dart';

class SettingsCard extends StatelessWidget {
  final UserModel user;
  const SettingsCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      text: LocaleKeys.settings,
      suffixChild: Padding(
        padding: context.horizontalNormal,
        child: const Icon(Icons.chevron_right_outlined),
      ),
      child: const Icon(Icons.settings),
      onPressed: () {
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text(LocaleKeys.settings)),
            body: Center(
              child: Column(
                children: [
                  ListTile(
                    title: Text(user.name ?? ""),
                    subtitle: Text(user.address?.street ?? ""),
                  )
                ],
              ),
            ),
          );
        }));
      },
    );
  }
}
