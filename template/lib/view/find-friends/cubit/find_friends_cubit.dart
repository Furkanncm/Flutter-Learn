import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/constants/app/app_constants.dart';
import 'package:template/view/find-friends/model/find_friends.dart';
import 'package:template/view/find-friends/service/IFindFriends_service.dart';
import 'package:template/view/find-friends/service/find_friends_service.dart';

class FindFriendsCubit extends Cubit<FindFriendsCubitState> {
  FindFriendsCubit() : super(FindFriendsCubitInitial());
  bool isLoading = false;
  final IfindfriendsService service = FindFriendsService(dio: Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL)));
  List<FindFriends>? data = [];
  void changeLoading() {
    isLoading = !isLoading;
    emit(FindFriendsCubitLoading(isLoading: isLoading));
  }

  Future<void> fetchFriends() async {
    changeLoading();
    data = await service.fetchFriends();
    if (data == null) return;
    emit(FindFriendsCubitLoaded(friends: data ?? []));
    print(data!.length??0);
    changeLoading();
  }
}

abstract class FindFriendsCubitState {}

class FindFriendsCubitInitial extends FindFriendsCubitState {}

class FindFriendsCubitLoading extends FindFriendsCubitState {
  final bool isLoading;

  FindFriendsCubitLoading({required this.isLoading});
}

class FindFriendsCubitLoaded extends FindFriendsCubitState {
  final List<FindFriends> friends;

  FindFriendsCubitLoaded({required this.friends});
}

class FindFriendsCubitError extends FindFriendsCubitState {
  final String message;

  FindFriendsCubitError({required this.message});
}
