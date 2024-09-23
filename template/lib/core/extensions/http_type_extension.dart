import '../constants/enum/http_type_enum.dart';

extension HttpTypeExtension on HttpTypeEnum {
  String get rawValue {
    switch (this) {
      case HttpTypeEnum.GET:
        return "GET";
      case HttpTypeEnum.POST:
        return "POST";
    }
  }
}
