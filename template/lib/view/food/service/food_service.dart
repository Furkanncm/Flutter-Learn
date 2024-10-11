import 'dart:io';

import 'package:template/view/food/model/food_model.dart';
import 'package:template/view/food/service/IFoodService.dart';

import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extensions.dart';

class FoodService extends IFoodService {
  FoodService({required super.dio});

  @override
  Future<List<FoodModel>?> fetchUsers() async {
    var response = await dio.get(ServicePathEnum.USERS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final result = response.data as List;
      return result.map((e){ return FoodModel.fromJson(e);}).toList();
    }
    return null;
  }
}
