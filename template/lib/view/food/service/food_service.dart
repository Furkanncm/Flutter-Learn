import 'dart:io';

import 'package:template/view/food/model/food_model.dart';
import 'package:template/view/food/service/IFoodService.dart';

import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extensions.dart';

class FoodService extends IFoodService {
  FoodService({required super.dio});

  @override
  Future<FoodModel?> fetchUsers() async {
    var response = await dio.get(ServicePathEnum.RECIPES.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final result = response.data as Map<String, dynamic>;
      final food = FoodModel.fromJson(result);
      return food;
    }
    return null;
  }

  @override
  Future<List<Recipes>?> fetchRecipes() async {
    var response = await fetchUsers();
    var recieps = response?.recipes?.map((e) => e).toList();
    return recieps;
  }
}
