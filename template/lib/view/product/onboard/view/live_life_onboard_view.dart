import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/constants/enum/preferences_enum.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../widget/live_life_description.dart';
import '../../widget/live_live_title.dart';
import '../cubit/live_life_cubit.dart';
import '../model/live_life_onboard_model.dart';

class LiveLifeOnboardView extends StatefulWidget {
  const LiveLifeOnboardView({super.key});
  @override
  State<LiveLifeOnboardView> createState() => _LiveLifeOnboardViewState();
}

class _LiveLifeOnboardViewState extends BaseState<LiveLifeOnboardView>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: LiveLifeOnboardModel.liveLifeOnboardModelItems.length,
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LiveLifeCubit>(
      create: (context) => LiveLifeCubit(tabController),
      child: Builder(builder: (context) {
        return _scaffold(context);
      }),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Expanded(child: _pageViewBuilder(context)),
            TabPageSelector(controller: tabController)
          ],
        ),
      ),
      floatingActionButton: _fabButton(context),
    );
  }

  Widget _pageViewBuilder(BuildContext context) {
    return PageView.builder(
        onPageChanged: (value) {
          context.read<LiveLifeCubit>().changePage(value);
        },
        itemCount: LiveLifeOnboardModel.liveLifeOnboardModelItems.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                  child: LiveLifeOnboardModel
                      .liveLifeOnboardModelItems[index].lottie),
              LiveLiveTitle(
                  text: LiveLifeOnboardModel
                      .liveLifeOnboardModelItems[index].title),
              LiveLifeDescription(
                  text: LiveLifeOnboardModel
                      .liveLifeOnboardModelItems[index].description),
              const SizedBox(height: 100)
            ],
          );
        });
  }

  Widget _fabButton(BuildContext context) {
    final pageIndex = context.watch<LiveLifeCubit>().currentPage;
    return pageIndex != 2
        ? const SizedBox.shrink()
        : FloatingActionButton(
            onPressed: () {
              context.read<LiveLifeCubit>().skipOnBoard(context);
              LocaleManager.instance.setBoolValue(PreferencesEnum.SKIP, true);
            },
            child: const Icon(Icons.arrow_forward_outlined));
  }
}
