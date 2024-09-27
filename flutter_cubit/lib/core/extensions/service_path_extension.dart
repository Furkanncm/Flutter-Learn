import 'package:flutter_cubit/core/constants/enum/service_path_enum.dart';

extension ServicePathExtension on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.login:
        return "/login";
    }
  }
}
