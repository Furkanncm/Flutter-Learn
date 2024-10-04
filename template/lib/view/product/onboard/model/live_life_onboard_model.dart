import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/enum/image_enum.dart';
import '../../../../core/extensions/image_extensions.dart';
import '../../../../core/init/language/locale_keys.g.dart';

class LiveLifeOnboardModel {
  final String title;
  final String description;
  final Widget lottie;

  LiveLifeOnboardModel(
      {required this.title, required this.description, required this.lottie});

  static List<LiveLifeOnboardModel> liveLifeOnboardModelItems = [
    LiveLifeOnboardModel(
        title: LocaleKeys.chef,
        description: LocaleKeys.chefDescription,
        lottie: Lottie.asset(ImageEnum.CHEF.imagePath)),
    LiveLifeOnboardModel(
        title: LocaleKeys.deliver,
        description: LocaleKeys.deliverDescription,
        lottie: Lottie.asset(ImageEnum.DELIVER.imagePath,)),
    LiveLifeOnboardModel(
        title: LocaleKeys.burger,
        description: LocaleKeys.burgerDescription,
        lottie: Lottie.asset(ImageEnum.BURGER.imagePath)),
  ];
}
