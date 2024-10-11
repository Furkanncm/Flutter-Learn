import 'package:dio/dio.dart';

import '../model/food_model.dart';

abstract class IFoodService {
  final Dio dio;

  IFoodService({required this.dio});
  Future<FoodModel?> fetchUsers();
  Future<List<Recipes>?> fetchRecipes();
}
