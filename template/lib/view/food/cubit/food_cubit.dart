import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/view/food/_product/enum/filter_enum.dart';

import '../../../core/constants/app/app_constants.dart';
import '../model/food_model.dart';
import '../service/IFoodService.dart';
import '../service/food_service.dart';

class FoodCubit extends Cubit<FoodCubitState> {
  FoodCubit() : super(FoodCubitInitial());
  final IFoodService foodService = FoodService(dio: Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL)));

  List<Recipes>? recieps;
  bool isDescendingRating = true;
  bool isDescendingCuisine = true;
  bool isDescendingReview = true;
  Future<List<Recipes>?> fetchRecipes() async {
    recieps = await foodService.fetchRecipes();
    if (recieps != null) {
      emit(ItemLoaded(recieps: recieps));
    } else {
      emit(ItemLoaded(recieps: []));
    }
    return null;
  }

  List<Recipes>? filterBy(FilterEnum filter) {
    switch (filter) {
      case FilterEnum.RATING:
        recieps!.sort((a, b) => a.rating!.compareTo(b.rating!));
        if (isDescendingRating) {
          recieps = recieps?.reversed.toList();
        }
        isDescendingRating = !isDescendingRating;
        emit(ItemLoaded(recieps: recieps));
        break;
      case FilterEnum.CUISENE:
        recieps!.sort((a, b) => a.cuisine!.compareTo(b.cuisine!));
        if (isDescendingCuisine) {
          recieps = recieps?.reversed.toList();
        }
        isDescendingCuisine = !isDescendingCuisine;
        emit(ItemLoaded(recieps: recieps));
        break;
      case FilterEnum.TOPREVIEW:
        recieps!.sort((a, b) => a.reviewCount!.compareTo(b.reviewCount!));
        if (isDescendingReview) {
          recieps = recieps?.reversed.toList();
        }
        isDescendingReview = !isDescendingReview;
        var reversed = recieps?.reversed.toList();
        emit(ItemLoaded(recieps: reversed));
        break;
    }
    return null;
  }

  List<Recipes> filter(bool isDescending, List<Recipes> recieps, FilterEnum filter) {
    if (isDescending) {
      return recieps.reversed.toList();
    }
    isDescending = !isDescending;
    emit(ItemLoaded(recieps: recieps));
    return recieps;
  }
}

abstract class FoodCubitState {}

class FoodCubitInitial extends FoodCubitState {}

class ItemLoaded extends FoodCubitState {
  final List<Recipes>? recieps;

  ItemLoaded({required this.recieps});
}
