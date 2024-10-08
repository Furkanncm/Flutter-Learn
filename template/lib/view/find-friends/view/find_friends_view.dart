import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../cubit/find_friends_cubit.dart';
import '../widget/search_bar.dart';
import '../widget/text_button.dart';

class FindFriendsView extends StatefulWidget {
  const FindFriendsView({super.key});

  @override
  State<FindFriendsView> createState() => _FindFriendsViewState();
}

class _FindFriendsViewState extends State<FindFriendsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FindFriendsCubit>(
        create: (context) => FindFriendsCubit()..fetchFriends(),
        child: Scaffold(
            appBar: AppBar(
                title: Align(
                  alignment: Alignment.topLeft,
                  child: FindTextButton(text: LocaleKeys.cancel, onPressed: () {}, textStyle: Theme.of(context).textTheme.labelSmall),
                ),
                actions: [FindTextButton(text: LocaleKeys.next, onPressed: () {}, textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold))]),
            body: Column(
              children: [
                const _FindText(),
                BlocBuilder<FindFriendsCubit, FindFriendsCubitState>(
                  builder: (context, state) {
                    return Expanded(
                        flex: 8,
                        child: state is FindFriendsCubitLoading
                            ? const CircularProgressIndicator.adaptive()
                            : Container(
                                color: Theme.of(context).canvasColor,
                                child: context.watch<FindFriendsCubit>().isLoading
                                    ? const Center(child: CircularProgressIndicator.adaptive())
                                    : ListView.separated(
                                        itemCount: state is FindFriendsCubitLoaded ? state.cart.length : 0,
                                        separatorBuilder: (BuildContext context, int index) {
                                          return const Divider();
                                        },
                                        itemBuilder: (BuildContext context, int index) {
                                          var cart = context.read<FindFriendsCubit>().data?.carts?[index];
                                          return Card(
                                            child: ListTile(leading: const CircleAvatar(), title: Text(cart?.total.toString() ?? "")),
                                          );
                                        },
                                      )));
                  },
                )
              ],
            )));
  }
}

class _FindText extends StatelessWidget {
  const _FindText();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: context.paddingLow,
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [FindTextButton(text: LocaleKeys.findFriends, onPressed: () {}, textStyle: Theme.of(context).textTheme.headlineMedium), const CustomSearchBar()],
            ),
          ),
        ));
  }
}
