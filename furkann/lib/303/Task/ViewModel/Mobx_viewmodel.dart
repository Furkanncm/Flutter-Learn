import 'package:dio/dio.dart';
import '../Model/Mobx_Model.dart';
import '../Service/IMobxService.dart';
import '../Service/MobxService.dart';
import 'package:mobx/mobx.dart';
part 'Mobx_viewmodel.g.dart';

class MobxViewModel = _MobxViewModelBase with _$MobxViewModel;

abstract class _MobxViewModelBase with Store {
  @observable
  List<ToDoModel>? items = [];

  @observable
  bool isLoading = false;
  late final Dio dio;
  late IMobxService service;
  final String baseurl = "https://jsonplaceholder.typicode.com";

  @action
  Future<void> getItemFromService() async {
    changeLoading();
    items = await service.fetchItems();
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  _MobxViewModelBase() {
    dio = Dio(BaseOptions(baseUrl: baseurl));
    service = Mobxservice(dio: dio);
    getItemFromService();
  }
}
