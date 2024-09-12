import 'package:dio/dio.dart';
import '../model/PhotoModel.dart';

abstract class Iphotoservice {
  final Dio dio;

  Iphotoservice({required this.dio});
  
  Future<List<PhotoModel>> fetchPhotos();
}
