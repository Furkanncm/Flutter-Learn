import 'package:flutter/material.dart';
import '../product/constant/lottie_item.dart';
import '../product/global/theme_notifer.dart';
import '../product/navigator/NavigatorRoutes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  Color background = Colors.transparent;
  bool _islight = false;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void changeTheme() {
    _islight = !_islight;
  }

  Future<void> navigateToHome() async {
    await Future.delayed(Durations.medium4);
    Navigator.of(context).pushReplacementNamed(NavigatorRouter.home.addSlash);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                controller.animateTo(_islight ? 1 : 0);
                changeTheme();
                context.read<ThemeNotifer>().changeTheme();
              },
              child: Lottie.asset(LottieItem.changeTheme2.lottiePath,
                  repeat: false, controller: controller))
        ],
      ),
      body: const Column(
        children: [
          _LoadingLottie(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigateToHome();
      }),
    );
  }
}

class _LoadingLottie extends StatelessWidget {
  const _LoadingLottie();

  @override
  Widget build(BuildContext context) {
    const loadingLottie =
        "https://lottie.host/07702381-2ae4-403a-8e76-e84ddefe0924/N0jNL8d1WH.json";
    return Center(
      child: Lottie.network(loadingLottie),
    );
  }
}
