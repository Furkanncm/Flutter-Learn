import 'package:dio/dio.dart';

import '../model/game_model.dart';

abstract class IGameService {
  final Dio dio;

  IGameService({required this.dio});

  Future<List<GameModel>?> getGameCart();
}
