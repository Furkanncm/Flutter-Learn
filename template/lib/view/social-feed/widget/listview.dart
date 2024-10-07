import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/components/text/card_medium_text.dart';
import 'package:template/view/social-feed/cubit/feed_cubit.dart';
import 'package:template/view/social-feed/model/card_model.dart';

import '../../../core/components/text/card_small_text.dart';

class Listview extends StatelessWidget {
  final CardModel model;
  const Listview({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: model.image,
        trailing: BlocConsumer<FeedCubit, FeedCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<FeedCubit>().changeLikedState(model);
              },
              icon: Icon(model.isLiked ? Icons.favorite : Icons.favorite_border_outlined),
            );
          },
        ),
        title: CardMediumText(text: model.title),
        subtitle: CardSmallText(text: model.description),
      ),
    );
  }
}
