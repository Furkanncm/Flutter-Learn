import 'package:template/view/food/_product/enum/filter_enum.dart';

extension FilterEnumExtension on FilterEnum{
  String get name {
    switch (this) {
      case FilterEnum.RATING:
        return 'rating';
      case FilterEnum.CUISENE:
        return 'cuisine';
      case FilterEnum.TOPREVIEW:
        return 'reviewCount';
    }
  }

}