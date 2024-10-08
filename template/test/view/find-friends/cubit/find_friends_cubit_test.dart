// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:template/core/constants/app/app_constants.dart';
// import 'package:template/view/find-friends/model/find_friends.dart';
// import 'package:template/view/find-friends/service/IFindFriends_service.dart';
// import 'package:template/view/find-friends/service/find_friends_service.dart';

// void main() {
//   List<FindFriends>? searchItems = [];
//   List<FindFriends>? data = [];
//   final IfindfriendsService service = FindFriendsService(dio: Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL)));
//   setUp(() {});
//   test("asdadada", () {
//     Future<void> fetchFriend() async {
//       data = await service.fetchFriends();
//       if (data == null) return;
//       print(data!.length);
//     }

//     void fetchItem(String text) {
//       searchItems = data!.where((element) => element.total?.toString().contains(text) ?? false).toList();
//     }

//     fetchFriend();
//     fetchItem("4794");
//   });
// }
