import 'package:template/core/constants/enum/service_path_enum.dart';
import 'package:template/core/extensions/service_path_extensions.dart';
import 'package:template/view/dashboard/model/game_model.dart';

import 'IGameService.dart';

class GameService extends IGameService {
  GameService({required super.dio});

  Future<List<GameModel>?> getGameCart() async {
    var response = await dio.get(ServicePathEnum.PRODUCTS.rawValue);
    switch (response.statusCode) {
      case 200:
        if (response.data is List) {
          return (response.data as List).map((game) => GameModel.fromJson(game as Map<String, dynamic>)).toList();
        }
      default:
        return null;
    }
    return null;
  }
}
