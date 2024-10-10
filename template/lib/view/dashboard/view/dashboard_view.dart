import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/extensions/context_extension.dart';
import '../cubit/dashboard_cubit.dart';

import '../../../core/init/language/locale_keys.g.dart';
import '../_widget/row_cards.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with TickerProviderStateMixin {
  TabController? controller;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit()..fetchItems(),
      child: BlocBuilder<DashboardCubit, DashboardCubitState>(
        builder: (context, state) {
          if (state is ItemLoaded) {
            controller = TabController(length: context.read<DashboardCubit>().items?.length ?? 0, vsync: this);
          }
          return Scaffold(
            body: Column(
              children: [
                state is DashboardCubitInitial
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Expanded(
                        child: PageView.builder(
                            onPageChanged: (value) {
                              controller?.animateTo(value);
                            },
                            controller: PageController(viewportFraction: 0.7),
                            itemCount: state is ItemLoaded ? state.gameItems.length : 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: context.paddingLow,
                                child: state is ItemLoaded ? Image.network(state.gameItems[index].images!.first.replaceAll('"', "").replaceAll("[", "").replaceAll("]", "")) : const SizedBox(),
                              );
                            }),
                      ),
                TabPageSelector(indicatorSize: 9, controller: controller, color: Theme.of(context).secondaryHeaderColor, selectedColor: Theme.of(context).primaryColor),
                Expanded(child: RowCards(state: state, text: LocaleKeys.update)),
                Expanded(child: RowCards(state: state, text: LocaleKeys.popular))
              ],
            ),
          );
        },
      ),
    );
  }
}
