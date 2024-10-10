import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/core/constants/enum/image_enum.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/core/extensions/image_extensions.dart';
import 'package:template/core/init/language/locale_keys.g.dart';
import 'package:template/view/settings/_widget/facebook_card.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool values = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LocaleKeys.settings)),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  ImageEnum.HOME.imagePath,
                  width: context.width * 0.3,
                ),
                Column(
                  children: [Text(LocaleKeys.settings.tr()), Text(LocaleKeys.settings.tr())],
                )
              ],
            ),

            Center(child: FacebookCard()),
          ],
        ),
      ),
    );
  }
}
