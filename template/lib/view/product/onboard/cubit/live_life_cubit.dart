import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/login/view/login_view.dart';
import '../model/live_life_onboard_model.dart';

class LiveLifeCubit extends Cubit<LiveLifeCubitState> {
  LiveLifeCubit(
    this.tabController,
  ) : super(LiveLifeCubitInitial());

  int currentPage = 0;
  final TabController tabController;
  bool isSkipped = false;
  bool get _isLastPage =>
      currentPage == LiveLifeOnboardModel.liveLifeOnboardModelItems.length - 1;
  bool get isLastPageValue => _isLastPage;
  void changePage(int value) {
    currentPage = value;
    tabController.animateTo(value);
    emit(LiveLiveChangePage(currentPage: currentPage));
  }

  void skipOnBoard(BuildContext context) {
    isSkipped = true;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const LoginView();
    }));
    emit(LiveLifeSkipState(isSkipped: isSkipped));
  }
}

abstract class LiveLifeCubitState {}

class LiveLifeCubitInitial extends LiveLifeCubitState {}

class LiveLiveChangePage extends LiveLifeCubitState {
  final int currentPage;
  LiveLiveChangePage({
    required this.currentPage,
  });
}

class LiveLifeSkipState extends LiveLifeCubitState {
  final bool isSkipped;

  LiveLifeSkipState({required this.isSkipped});
}
