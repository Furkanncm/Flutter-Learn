import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/core/extensions/feed_top_extension.dart';
import 'package:template/view/social-feed/cubit/feed_cubit.dart';
import 'package:template/view/social-feed/widget/listview.dart';

import '../../../core/components/text/card_title_text.dart';
import '../../../core/constants/app/app_card_items.dart';
import '../../../core/constants/enum/feed_top_enum.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../widget/pageview.dart';

class FeedHomeView extends StatefulWidget {
  const FeedHomeView({super.key});
  @override
  State<FeedHomeView> createState() => _FeedHomeViewState();
}

class _FeedHomeViewState extends State<FeedHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedCubit>(
      create: (context) => FeedCubit(),
      child: DefaultTabController(
        length: FeedTop.values.length,
        child: Padding(
          padding: context.paddingLow,
          child: Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              actions: [Padding(padding: context.rightNormal, child: const Icon(Icons.search))],
              bottom: TabBar(
                tabs: FeedTop.values.map((e) => Tab(text: e.rawValue)).toList(),
              ),
            ),
            body: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _PageView()),
                Spacer(),
                CardTitleText(text: LocaleKeys.recommend),
                Expanded(flex: 4, child: _ListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: AppCardItems.pageViewItems.length,
        itemBuilder: (context, index) {
          return Pageview(model: AppCardItems.pageViewItems[index]);
        });
  }
}

class _ListView extends StatelessWidget {
  const _ListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AppCardItems.listViewItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Listview(model: AppCardItems.listViewItems[index]);
      },
    );
  }
}
