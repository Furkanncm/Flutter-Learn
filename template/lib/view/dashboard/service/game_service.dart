import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extensions.dart';
import '../model/game_model.dart';
import 'IGameService.dart';

class GameService extends IGameService {
  GameService({required super.dio});

  @override
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
