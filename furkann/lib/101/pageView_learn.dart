
import 'package:flutter/material.dart';

import 'package:furkann/101/firstPage.dart';
import 'package:furkann/101/listTile.dart';
import 'package:furkann/101/mainFood.dart';

class pageView extends StatefulWidget {
  const pageView({super.key});

  @override
  State<pageView> createState() => _pageViewState();
}

class _pageViewState extends State<pageView> {
  final _pageController = PageController();

  int currentPage = 1;
  void _pageCounter(int index) {
    setState(() {
      currentPage = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 58),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _floatingAcButton(
              icon: const Icon(Icons.chevron_left),
              method: () {
                _pageController.previousPage(
                    duration: customDuration.durationTime,
                    curve: _customCurve.CustomCurve);
              },
            ),
            Text(currentPage.toString()),
            _floatingAcButton(
              icon: const Icon(Icons.chevron_right),
              method: () {
                _pageController.nextPage(
                    duration: customDuration.durationTime,
                    curve: _customCurve.CustomCurve);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _pageCounter,
        children: [
          const firstPage(),
          const listTile(),
          mainFood(),
        ],
      ),
    );
  }
}

class _floatingAcButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback method;
  const _floatingAcButton({
    super.key,
    required this.icon,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: method,
      child: icon,
    );
  }
}

class customDuration {
  static final durationTime = const Duration(seconds: 1);
}

class _customCurve {
  static const CustomCurve = Curves.easeInOut;
}
