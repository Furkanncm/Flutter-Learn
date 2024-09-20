import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:template/core/base/state/base_state.dart';
import 'package:template/core/base/view/base_view.dart';
import 'package:template/core/init/language/locale_keys.g.dart';
import 'package:template/view/authentication/test/viewmodel/test_viewmodel.dart';
import '../../../../core/components/text/locale_text.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewmodel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onDispose: () {},
      onPageBuilder: (context, viewmodel) {
        return scaffoldBody;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
    appBar: AppBar(
      title: LocaleText(text: LocaleKeys.welcome,),
    ),
        floatingActionButton: _floatingActionButtonIncrementNumber,
        body: Center(
          child: _numberText,
        ),
      );

  Widget get _floatingActionButtonIncrementNumber {
    return FloatingActionButton(onPressed: () {
      viewModel.incrementNumber();
    });
  }

  Widget get _numberText => Observer(builder: (context) {
        return Text(viewModel.number.toString());
      });
}
