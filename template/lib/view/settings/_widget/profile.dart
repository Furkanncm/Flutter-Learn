import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enum/image_enum.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/image_extensions.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../cubit/settings_cubit.dart';
import 'text_padding.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsCubitState>(
      builder: (context, state) {
        return Row(
          children: [
            Image.asset(ImageEnum.HOME.imagePath, width: context.width * 0.3, fit: BoxFit.cover),
            Padding(
              padding: context.paddingLow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.star, size: 15),
                    TextPadding(text: LocaleKeys.premium, style: Theme.of(context).textTheme.labelSmall),
                  ]),
                  TextPadding(text: context.read<SettingsCubit>().users?.first.name ?? "", style: Theme.of(context).textTheme.labelMedium),
                  TextPadding(text: context.read<SettingsCubit>().users?.first.email ?? "", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
