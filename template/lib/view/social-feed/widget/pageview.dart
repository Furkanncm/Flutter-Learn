import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/components/text/card_medium_text.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/core/extensions/image_extensions.dart';
import 'package:template/view/social-feed/cubit/feed_cubit.dart';
import 'package:template/view/social-feed/model/card_model.dart';
import '../../../core/components/text/card_small_text.dart';
import '../../../core/constants/enum/image_enum.dart';

class Pageview extends StatelessWidget {
  final CardModel model;
  const Pageview({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SizedBox(
        height: context.height * 0.30,
        child: Stack(
          children: [
            Positioned.fill(bottom: context.height * 0.15, right: 5, child: Image.asset(ImageEnum.HOME.imagePath, fit: BoxFit.cover)),
            Positioned(
              top: context.height * 0.11,
              right: 10,
              left: 5,
              child: Card(
                child: Column(
                  children: [
                    _ListTileWidget(model: model),
                    CardMediumText(text: model.title),
                    Padding(padding: context.bottomLow + context.leftLow, child: CardSmallText(text: model.description)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
    required this.model,
  });

  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: BlocConsumer<FeedCubit, FeedCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<FeedCubit>().changeLikedState(model);
                },
                icon: Icon(model.isLiked ? Icons.favorite : Icons.favorite_border));
          },
        ),
        leading: model.avatar,
        title: CardSmallText(text: "by ${model.name}"),
        subtitle: CardSmallText(text: model.dateTime.toString()));
  }
}
