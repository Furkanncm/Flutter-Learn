import 'package:dio/dio.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/model/PhotoModel.dart';

abstract class Iphotoservice {
  final Dio dio;

  Iphotoservice({required this.dio});
  
  Future<List<PhotoModel>> fetchPhotos();
}
