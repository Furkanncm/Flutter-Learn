import 'package:flutter/material.dart';
import '../enum/filter_enum.dart';

extension FoodTabbarExtension on FilterEnum {
  String get name {
    switch (this) {
      case FilterEnum.RATING:
        return 'Rating';
      case FilterEnum.CUISENE:
        return 'Cuisine';
      case FilterEnum.TOPREVIEW:
        return 'Top Review';
    }
  }

  Widget get icon {
    switch (this) {
      case FilterEnum.RATING:
        return const Icon(Icons.star);
      case FilterEnum.CUISENE:
        return const Icon(Icons.flag);
      case FilterEnum.TOPREVIEW:
        return const Icon(Icons.rate_review);
    }
  }
}
