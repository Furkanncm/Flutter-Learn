import 'dart:io';
import 'package:template/core/constants/enum/service_path_enum.dart';
import 'package:template/core/extensions/service_path_extensions.dart';
import 'package:template/view/find-friends/service/IFindFriends_service.dart';

import '../model/find_friends.dart';

class FindFriendsService extends IfindfriendsService {
  FindFriendsService({required super.dio});

  @override
  Future<List<FindFriends>?> fetchFriends() async {
    final response = await dio.get(ServicePathEnum.CARTS.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => FindFriends.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          print(data);
          return [FindFriends.fromJson(data)];
        } else {
          return data;
        }
    }
    return [];
  }
}
