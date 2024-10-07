import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/view/find-friends/cubit/find_friends_cubit.dart';

import '../../../core/init/language/locale_keys.g.dart';
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
      create: (context) => FindFriendsCubit(),
      child: BlocConsumer<FindFriendsCubit, FindFriendsCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Align(
                  alignment: Alignment.topLeft,
                  child: FindTextButton(
                      text: LocaleKeys.cancel,
                      onPressed: () async {
                        await context.read<FindFriendsCubit>().fetchFriends();
                      },
                      textStyle: Theme.of(context).textTheme.labelSmall),
                ),
                actions: [FindTextButton(text: LocaleKeys.next, onPressed: () {}, textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold))],
              ),
              body: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: context.paddingLow,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              FindTextButton(text: LocaleKeys.findFriends, onPressed: () {}, textStyle: Theme.of(context).textTheme.headlineMedium),
                              const CustomSearchBar(),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: Theme.of(context).canvasColor,
                      child: ListView.separated(
                        itemCount: context.read<FindFriendsCubit>().data?.length ?? 6,
        
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return BlocConsumer<FindFriendsCubit, FindFriendsCubitState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              var cart = context.read<FindFriendsCubit>().data![index].carts![index].products![index];
                              return Card(
                                child: ListTile(
                                  leading: Image.network(cart.thumbnail ?? ""),
                                  title: Text(context.read<FindFriendsCubit>().data![index].carts![index].products![index].title.toString()),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FindFriendsCubit, FindFriendsCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is FindFriendsCubitLoading
            ? const CircularProgressIndicator.adaptive()
            : Expanded(
                flex: 8,
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: ListView.separated(
                    itemCount: state is FindFriendsCubitLoaded ? state.friends.length : 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const Text("data");
                    },
                  ),
                ),
              );
      },
    );
  }
}
