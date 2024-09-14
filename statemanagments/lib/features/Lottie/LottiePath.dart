enum LottiePath { Lottie_Chef, Lottie_Delivery, Lottie_Order,Lottie_Login }

extension LottiePathExtensions on LottiePath {
  String path() {
    switch (this) {
      case LottiePath.Lottie_Chef:
        return "Lottie_Chef";
      case LottiePath.Lottie_Delivery:
        return "Lottie_Delivery";
      case LottiePath.Lottie_Order:
        return "Lottie_Order";
      case LottiePath.Lottie_Login:
        return "Lottie_Login";
    }
  }

  String get lottiePath => "assets/Lottie/${path()}.json";
}
