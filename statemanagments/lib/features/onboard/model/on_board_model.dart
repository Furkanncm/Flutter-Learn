import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:statemanagments/features/onboard/Lottie/LottiePath.dart';

class OnBoardModel {
  final String title;
  final String description;
  final Widget lottie;

  OnBoardModel(
      {required this.title, required this.description, required this.lottie});
}

 class  DummyModels {
  static final List<OnBoardModel> onBoardModel = [
    OnBoardModel(
        title: "Chef",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac facilisis tellus.",
        lottie: Lottie.asset(LottiePath.Lottie_Chef.lottiePath)),
    OnBoardModel(
        title: "Delivery",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac facilisis tellus.",
        lottie: Lottie.asset(LottiePath.Lottie_Delivery.lottiePath)),
    OnBoardModel(
        title: "Order",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac facilisis tellus.",
        lottie: Lottie.asset(LottiePath.Lottie_Order.lottiePath))
  ];
}
