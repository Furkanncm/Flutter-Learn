import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../features/Lottie/LottiePath.dart';

class AnimatedLottie extends StatefulWidget {
  const AnimatedLottie({super.key});

  @override
  State<AnimatedLottie> createState() => _AnimatedLottieState();
}

class _AnimatedLottieState extends State<AnimatedLottie> {
  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isKeyboardVisible(context) ? 0 : 1.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isKeyboardVisible(context)
            ? 0
            : MediaQuery.of(context).size.height * 0.35,
        child: Lottie.asset(
          LottiePath.Lottie_Login.lottiePath,
        ),
      ),
    );
  }
}
