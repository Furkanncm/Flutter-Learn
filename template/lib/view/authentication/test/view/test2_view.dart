import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/core/constants/enum/route_enum.dart';
import 'package:template/core/init/navigation/navigation_service.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../../core/components/text/locale_text.dart';

class Test2View extends StatefulWidget {
  const Test2View({super.key});
  @override
  State<Test2View> createState() => _Test2ViewState();
}

class _Test2ViewState extends BaseState<Test2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                NavigationService.instance.navigateToPage(RouteEnum.HOME.route, "");
              },
              icon: const Icon(Icons.route_outlined)),
          title: const LocaleText(text: LocaleKeys.welcome),
          actions: [_changeThemeButton(context)]),
      body: const Center(child: LocaleText(text: LocaleKeys.body)),
    );
  }

  IconButton _changeThemeButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeNotifier>().changeTheme();
      },
      icon: const Icon(Icons.color_lens_outlined),
    );
  }
}
