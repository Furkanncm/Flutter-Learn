import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/button/title_text_button.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewmodel: LoginViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
      },
      onDispose: () {},
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleTextButton(
                  text: LocaleKeys.body.locale,
                  onPressed: (String value) {
                    value = LocaleKeys.welcome.locale;
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Center(child: Text(value))));
                  }),
            ],
          ),
        );
      },
    );
  }
}
