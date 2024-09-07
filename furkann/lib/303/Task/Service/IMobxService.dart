import 'package:dio/dio.dart';
import 'package:furkann/303/Task/Model/Mobx_Model.dart';

abstract class IMobxService {
  final Dio dio;
  
  IMobxService({required this.dio});
  Future<List<ToDoModel>> fetchItems();
}
