import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
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
    return Stack(
      children: [
        Center(child: Lottie.asset(ImageEnum.BURGER.imagePath)),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Card(
            child: Column(
              children: [
                ListTile(
                    trailing: BlocConsumer<FeedCubit, FeedCubitState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              state is IsLiked
                                  ? context
                                      .read<FeedCubit>()
                                      .changeLikedState(model)
                                  : null;
                            },
                            icon: Icon(model.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border));
                      },
                    ),
                    leading: model.avatar,
                    title: CardSmallText(text: "by ${model.name}"),
                    subtitle: CardSmallText(text: model.dateTime.toString())),
                CardMediumText(text: model.title),
                Padding(
                    padding: context.bottomLow + context.leftLow,
                    child: CardSmallText(text: model.description))
              ],
            ),
          ),
        )
      ],
    );
  }
}
