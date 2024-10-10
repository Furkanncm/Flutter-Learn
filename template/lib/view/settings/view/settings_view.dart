import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/enum/image_enum.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/image_extensions.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../_widget/settings_card.dart';
import '../cubit/settings_cubit.dart';
import '../model/user_model.dart';

import '../_widget/aboutme_card.dart';
import '../_widget/logout_card.dart';
import '../_widget/my_account_card.dart';
import '../_widget/positioned_item.dart';
import '../_widget/profile.dart';
import '../_widget/text_padding.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool values = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..fetchItems(),
      child: Scaffold(
        appBar: AppBar(title: const Text(LocaleKeys.settings)),
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileCard(),
                TextPadding(text: LocaleKeys.options, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey)),
                Stack(
                  children: [
                    Card(
                      elevation: 5,
                      child: SizedBox(
                        width: context.width,
                        height: context.height * 0.15,
                        child: Image.asset(ImageEnum.PREMIUM.imagePath, fit: BoxFit.fill),
                      ),
                    ),
                    PositionedItem(top: context.height * 0.01, text: LocaleKeys.premium),
                    PositionedItem(top: context.height * 0.11, text: LocaleKeys.seeAll),
                  ],
                ),
                Padding(
                  padding: context.verticalLow,
                  child: BlocBuilder<SettingsCubit, SettingsCubitState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const MyAccountCard(),
                          SettingsCard(user: context.read<SettingsCubit>().users?.first ?? UserModel()),
                          const AboutmeCard(),
                          const LogoutCard(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
