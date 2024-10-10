import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app/app_constants.dart';
import '../model/game_model.dart';
import '../service/IGameService.dart';

import '../service/game_service.dart';

class DashboardCubit extends Cubit<DashboardCubitState> {
  DashboardCubit() : super(DashboardCubitInitial());

  final IGameService service = GameService(dio: Dio(BaseOptions(baseUrl: AppConstants.DASHBOARD_URL)));

  List<GameModel>? items;
  Future<void> fetchItems() async {
    if (items?.first.title?.isNotEmpty ?? false) {
      print(items);
      emit(ItemLoaded(gameItems: items ?? []));
    } else {
      print("object");
      items = await service.getGameCart() ?? [];
      emit(ItemLoaded(gameItems: items ?? []));
    }
  }
}

abstract class DashboardCubitState {}

class DashboardCubitInitial extends DashboardCubitState {}

class ItemLoaded extends DashboardCubitState {
  final List<GameModel> gameItems;

  ItemLoaded({required this.gameItems});
}
