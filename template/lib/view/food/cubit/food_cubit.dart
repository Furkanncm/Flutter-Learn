import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/view/food/model/food_model.dart';
import 'package:template/view/food/service/IFoodService.dart';
import 'package:template/view/food/service/food_service.dart';

import '../../../core/constants/app/app_constants.dart';

class FoodCubit extends Cubit<FoodCubitState> {
  FoodCubit() : super(FoodCubitInitial());
  final IFoodService foodService = FoodService(dio: Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL)));

  List<Recipes>? recieps;
  Future<List<Recipes>?> fetchRecipes() async {
    recieps = await foodService.fetchRecipes();
    if (recieps != null) {
      emit(ItemLoaded(recieps: recieps));
    } else {
      emit(ItemLoaded(recieps: []));
    }
    return null;
  }
}

abstract class FoodCubitState {}

class FoodCubitInitial extends FoodCubitState {}

class ItemLoaded extends FoodCubitState {
  final List<Recipes>? recieps;

  ItemLoaded({required this.recieps});
}
