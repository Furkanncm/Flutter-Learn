import 'package:flutter/material.dart';
import '../../../core/components/button/normal_text_button.dart';
import '../../../core/extensions/context_extension.dart';
import '../../authentication/onboard/view/onboard_view.dart';

import '../../../core/init/language/locale_keys.g.dart';

class CubitLoginForgotTextbutton extends StatelessWidget {
  const CubitLoginForgotTextbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.leftHigh,
      child: NormalTextButton(
          child: Text(LocaleKeys.forgotPassword,
              style: Theme.of(context).textTheme.labelMedium),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const OnboardView();
            }));
          }),
    );
  }
}
