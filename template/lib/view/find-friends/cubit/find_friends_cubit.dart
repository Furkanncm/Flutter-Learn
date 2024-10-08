import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app/app_constants.dart';
import '../model/find_friends.dart';
import '../service/IFindFriends_service.dart';
import '../service/find_friends_service.dart';

class FindFriendsCubit extends Cubit<FindFriendsCubitState> {
  FindFriendsCubit() : super(FindFriendsCubitLoading());
  bool isLoading = false;
  final IfindfriendsService service = FindFriendsService(dio: Dio(BaseOptions(baseUrl: AppConstants.FRIEND_BASE_URL)));
  FindFriends? data;
  List<Carts> searchItems = [];

  Future<void> fetchFriends() async {
    data = await service.fetchFriends();
    if (data == null) return;
    emit(FindFriendsCubitLoaded(cart: data?.carts ?? []));
    print(data?.carts?.length ?? 0);
  }

  void fetchItem(String text) {
    searchItems = data!.carts!.where((element) => element.total?.toString().contains(text) ?? false).toList();
    emit(FindFriendsCubitLoaded(cart: searchItems));
  }
}

abstract class FindFriendsCubitState {}

class FindFriendsCubitLoading extends FindFriendsCubitState {
  FindFriendsCubitLoading();
}

class FindFriendsCubitLoaded extends FindFriendsCubitState {
  final List<Carts> cart;

  FindFriendsCubitLoaded({required this.cart});
}

class FindFriendsCubitError extends FindFriendsCubitState {
  final String message;

  FindFriendsCubitError({required this.message});
}

