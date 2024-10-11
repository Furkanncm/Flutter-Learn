import 'dart:io';

import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extensions.dart';
import '../model/food_model.dart';
import 'IFoodService.dart';

class FoodService extends IFoodService {
  FoodService({required super.dio});

  @override
  Future<FoodModel?> fetchUsers() async {
    var response = await dio.get(ServicePathEnum.RECIPES.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final result = response.data as Map<String, dynamic>;
      return FoodModel.fromJson(result);
    }
    return null;
  }

  @override
  Future<List<Recipes>?> fetchRecipes() async {
    var response = await fetchUsers();
    return response?.recipes;
  }
}
