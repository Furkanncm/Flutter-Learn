import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/constants/enum/route_enum.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../viewmodel/test_viewmodel.dart';
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
  TestViewModel viewModel = TestViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          const Center(child: LocaleText(text: LocaleKeys.body)),
          Expanded(child: _items()),
        ],
      ),
    );
  }

  Observer _items() {
    return Observer(builder: (_) {
      if (viewModel.items.isEmpty) {
        return const Center(child: Text("No data available"));
      }
      return _listview();
    });
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        leading: _navigatorButton(),
        title: const LocaleText(text: LocaleKeys.welcome),
        actions: [_changeThemeButton(context)]);
  }

  ListView _listview() {
    return ListView.separated(
      itemCount: viewModel.items.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return _listviewCard(index);
      },
    );
  }

  Card _listviewCard(int index) {
    return Card(
      elevation: 10,
      child: ListTile(
        title: Text(viewModel.items[index].title ?? "No Title"),
      ),
    );
  }

  IconButton _navigatorButton() {
    return IconButton(
        onPressed: () {
          NavigationService.instance
              .navigateToPage(RouteEnum.HOME.route, "Kazım");
        },
        icon: const Icon(Icons.route_outlined));
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
