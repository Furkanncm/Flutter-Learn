import 'package:dio/dio.dart';
import '../model/travel_model.dart';

abstract class Iservice {
  final Dio dio;

  Iservice({required this.dio});

  Future<List<TravelModel>?> fetchItems();
}
