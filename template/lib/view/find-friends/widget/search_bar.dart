import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/find_friends_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FindFriendsCubit, FindFriendsCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(state);
        return TextField(
          onChanged: (value) {
            context.read<FindFriendsCubit>().fetchItem(value);
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            prefixIconColor: Theme.of(context).iconTheme.color,
            iconColor: Theme.of(context).iconTheme.color,
            labelStyle: Theme.of(context).textTheme.displaySmall,
          ),
        );
      },
    );
  }
}
