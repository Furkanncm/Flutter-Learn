import 'package:flutter/material.dart';

import '../../../core/components/button/normal_text_button.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';

class CubitLoginHaveAccount extends StatelessWidget {
  const CubitLoginHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.bottomHigh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(LocaleKeys.haveAccount,
              style: Theme.of(context).textTheme.labelSmall),
          NormalTextButton(
            child: Text(
              LocaleKeys.register,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onPressed: () {
            },
          )
        ],
      ),
    );
  }
}
