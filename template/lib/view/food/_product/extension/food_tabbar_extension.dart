import 'package:flutter/material.dart';
import 'package:template/view/food/_product/enum/tabbar_enum.dart';

extension FoodTabbarExtension on FoodTabbarEnum {
  String get name {
    switch (this) {
      case FoodTabbarEnum.RATING:
        return 'Rating';
      case FoodTabbarEnum.CUISENE:
        return 'Cuisine';
      case FoodTabbarEnum.TOPREVIEW:
        return 'Top Review';
    }
  }

  Widget icon(String path) {
    switch (this) {
      case FoodTabbarEnum.RATING:
      case FoodTabbarEnum.CUISENE:
      case FoodTabbarEnum.TOPREVIEW:
        return Image.network(path);
    }
  }
}
