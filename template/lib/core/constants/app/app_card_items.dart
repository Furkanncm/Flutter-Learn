import 'package:flutter/material.dart';
import '../enum/image_enum.dart';
import '../../extensions/image_extensions.dart';
import '../../../view/social-feed/model/card_model.dart';

import '../../init/language/locale_keys.g.dart';

class AppCardItems {
  static final List<CardModel> pageViewItems = [
    CardModel(null,
        avatar: const CircleAvatar(),
        dateTime: DateTime.now(),
        name: LocaleKeys.betul,
        title: LocaleKeys.deliver,
        description: LocaleKeys.deliverDescription,
        isLiked: true),
    CardModel(null,
        avatar: const CircleAvatar(),
        dateTime: DateTime.now(),
        name: LocaleKeys.furkan,
        title: LocaleKeys.burger,
        description: LocaleKeys.burgerDescription,
        isLiked: false),
  ];

  static final List<CardModel> listViewItems = [
    CardModel(Image.asset(ImageEnum.HOME.imagePath),
        avatar: const CircleAvatar(),
        dateTime: DateTime.utc(2024),
        name: LocaleKeys.emirhan,
        title: LocaleKeys.chef,
        description: LocaleKeys.chefDescription,
        isLiked: false),
    CardModel(Image.asset(ImageEnum.HOME.imagePath),
        avatar: const CircleAvatar(),
        dateTime: DateTime.timestamp(),
        name: LocaleKeys.ibrahim,
        title: LocaleKeys.deliver,
        description: LocaleKeys.deliverDescription,
        isLiked: true)
  ];
}
