enum LottiePath { Lottie_Chef, Lottie_Delivery, Lottie_Order }

extension LottiePathExtensions on LottiePath {
  String path() {
    switch (this) {
      case LottiePath.Lottie_Chef:
        return "Lottie_Chef";
      case LottiePath.Lottie_Delivery:
        return "Lottie_Delivery";
      case LottiePath.Lottie_Order:
        return "Lottie_Order";
    }
  }

  String get lottiePath => "assets/Lottie/${path()}.json";
}
