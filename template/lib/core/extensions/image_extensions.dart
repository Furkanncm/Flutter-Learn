import '../constants/enum/image_enum.dart';

extension ImageExtensions on ImageEnum {
  String get _rawValue {
    switch (this) {
      case ImageEnum.BURGER:
        return 'asset/image/lottie_burger.json';
      case ImageEnum.CHEF:
        return 'asset/image/lottie_chef.json';
      case ImageEnum.DELIVER:
        return 'asset/image/lottie_deliver.json';
      case ImageEnum.LOGIN:
        return 'asset/image/lottie_login.json';
      case ImageEnum.HOME:
        return "asset/image/home.jpeg";
      case ImageEnum.PREMIUM:
        return "asset/image/pre.png";
    }
  }

  String get imagePath => _rawValue;
}
