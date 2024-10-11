import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/view/food/model/food_model.dart';
import 'package:template/view/food/service/IFoodService.dart';
import 'package:template/view/food/service/food_service.dart';

import '../../../core/constants/app/app_constants.dart';

class FoodCubit extends Cubit<FoodCubitState> {
  FoodCubit() : super(FoodCubitInitial());
  final IFoodService foodService = FoodService(dio: Dio(BaseOptions(baseUrl: AppConstants.SETTING_URL)));

  List<FoodModel>? users;
  Future<List<FoodModel>?> fetchUsers() async {
    users = await foodService.fetchUsers();
    if (users != null) {
      emit(ItemLoaded(foods: users!));
    } else {
      emit(ItemLoaded(foods:[]));
    }
    return null;
  }
}

abstract class FoodCubitState {}

class FoodCubitInitial extends FoodCubitState {}

class ItemLoaded extends FoodCubitState {
  final List<FoodModel>? foods;

  ItemLoaded({required this.foods});
}
