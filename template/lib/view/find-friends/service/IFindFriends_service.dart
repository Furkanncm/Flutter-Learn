import 'package:dio/dio.dart';

import '../model/find_friends.dart';

abstract class IfindfriendsService {
  final Dio dio;

  IfindfriendsService({required this.dio});
  Future<FindFriends?> fetchFriends();
}
