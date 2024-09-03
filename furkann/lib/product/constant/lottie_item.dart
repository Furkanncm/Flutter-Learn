enum LottieItem { changeTheme, SunChance, changeTheme2 }

extension LottieItemExtensions on LottieItem {
  String _path() {
    switch (this) {
      case LottieItem.changeTheme:
        return "LottieThemeChance";
      case LottieItem.SunChance:
        return "LottieThemeChanceSun";
      case LottieItem.changeTheme2:
        return "LottieThemeChance2";
    }
  }

  String get lottiePath => "asset/Lottie/${_path()}.json";
}
