import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:template/core/base/state/base_state.dart';
import 'package:template/core/base/view/base_view.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/view/authentication/onboard/viewmodel/onboard_viewmodel.dart';
import 'package:template/view/authentication/test/view/test2_view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});
  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends BaseState<OnboardView> {
  late final OnBoardViewModel viewmodel;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
        viewmodel: OnBoardViewModel(),
        onModelReady: (model) {
          viewmodel = model;
          viewmodel.setContext(context);
          viewmodel.init();
        },
        onDispose: () {},
        onPageBuilder: (BuildContext context, OnBoardViewModel model) {
          return Column(
            children: [
              _pageview(),
              _listview(),
            ],
          );
        });
  }

  Expanded _listview() {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: viewmodel.onBoardModels.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: context.paddingLow,
              child: Observer(builder: (_) {
                return CircleAvatar(
                    radius: viewmodel.currentIndex == index ? 10 : 5);
              }));
        },
      ),
    );
  }

  Widget _pageview() {
    return Expanded(
      flex: 9,
      child: PageView.builder(
          onPageChanged: (value) {
            viewmodel.changePage(value);
          },
          itemCount: viewmodel.onBoardModels.length,
          itemBuilder: (context, index) {
            return viewmodel.onBoardModels[index].page;
          }),
    );
  }
}
