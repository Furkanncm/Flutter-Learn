import 'dart:io';

import '../../../core/constants/enum/service_path_enum.dart';
import '../../../core/extensions/service_path_extensions.dart';
import '../model/find_friends.dart';
import 'IFindFriends_service.dart';

class FindFriendsService extends IfindfriendsService {
  FindFriendsService({required super.dio});

  @override
  Future<FindFriends?> fetchFriends() async {
    final response = await dio.get(ServicePathEnum.CARTS.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        return FindFriends.fromJson(data as Map<String, dynamic>);
      default:
        return null;
    }

  }
}
