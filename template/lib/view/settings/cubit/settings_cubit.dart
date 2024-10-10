import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app/app_constants.dart';
import '../model/user_model.dart';
import '../service/ISettingsService.dart';
import '../service/settings_service.dart';

class SettingsCubit extends Cubit<SettingsCubitState> {
  SettingsCubit() : super(SettingsCubitInitial());
  final ISettingsService settingsService = SettingsService(dio: Dio(BaseOptions(baseUrl: AppConstants.SETTING_URL)));

  List<UserModel>? users;
  Future<List<UserModel>> fetchItems() async {
    users = await settingsService.fetchUsers();
    if (users != null) {
      emit(ItemLoaded(users: users!));
    } else {
      emit(ItemLoaded(users: []));
    }
    return [];
  }
}

abstract class SettingsCubitState {}

class SettingsCubitInitial extends SettingsCubitState {}

class ItemLoaded extends SettingsCubitState {
  final List<UserModel> users;

  ItemLoaded({required this.users});
}
