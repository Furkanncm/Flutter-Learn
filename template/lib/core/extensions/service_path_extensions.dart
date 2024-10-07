import 'package:template/core/constants/enum/service_path_enum.dart';

extension ServicePathExtensions on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.CARTS:
        return '/carts';
    }
  }
}
