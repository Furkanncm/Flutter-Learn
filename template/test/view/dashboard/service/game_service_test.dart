import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/constants/app/app_constants.dart';
import 'package:template/core/constants/enum/service_path_enum.dart';
import 'package:template/core/extensions/service_path_extensions.dart';
import 'package:template/view/dashboard/model/game_model.dart';

void main() {
  final Dio dio = Dio(BaseOptions(baseUrl: AppConstants.DASHBOARD_URL));
  setUp(() {});
  test("game service test", () async {
    Future<List<GameCart>?> getGameCart() async {
      var response = await dio.get(ServicePathEnum.PRODUCTS.rawValue);
      switch (response.statusCode) {
        case 200:
            if (response.data is List) {
          return (response.data as List)
              .map((game) => GameCart.fromJson(game as Map<String, dynamic>))
              .toList();
        } 
        default:
          return null;
      }
    }

    await getGameCart();
  });
}
