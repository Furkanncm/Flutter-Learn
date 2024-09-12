import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statemanagments/features/onboard/model/on_board_model.dart';
import 'package:statemanagments/features/onboard/view/tabIndicator.dart';
import 'package:statemanagments/product/padding/page_padding.dart';
import 'package:statemanagments/product/widgets/onBoardCard.dart';

part "../module/startFabButton.dart";

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView>
    with TickerProviderStateMixin {
  final String skipText = "Skip";

  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get isNotLastPage =>
      _currentPage < DummyModels.onBoardModel.length - 1 ? true : false;
  bool get isFirstPage => _currentPage == 0;

  void _incrementAndAnimateTo() {
    _incrementSelectedPage();
  }

  void _decreaseAndAnimatedTo() {
    _decreaseSelectedPage();
  }

  void _incrementSelectedPage() {
    if (isNotLastPage) {
      setState(() {
        _currentPage++;
      });
    } else {
      setState(() {
        _currentPage = 0;
      });
    }
  }

  void _decreaseSelectedPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    } else {
      setState(() {
        _currentPage = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_currentPage);
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tabindicator(
                  currentPage: _currentPage,
                ),
                _Startfabbutton(
                  isNotLastPage: isNotLastPage,
                  onPressed: () {
                    _incrementAndAnimateTo();
                    _changePage();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: isFirstPage
          ? SizedBox.shrink()
          : IconButton(
              onPressed: () {
                _decreaseAndAnimatedTo();
                _changePage();
              },
              icon:
                  const Icon(color: Colors.white, Icons.chevron_left_outlined)),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            skipText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        itemCount: DummyModels.onBoardModel.length,
        itemBuilder: (context, index) {
          return Onboardcard(model: DummyModels.onBoardModel[index]);
        });
  }

  void _changePage() {
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
