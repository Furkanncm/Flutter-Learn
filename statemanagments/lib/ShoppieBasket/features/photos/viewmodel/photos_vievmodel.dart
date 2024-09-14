import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import '../model/photos_model.dart';
import '../service/INetworkManager.dart';
import '../service/NetworkManager.dart';
part 'photos_vievmodel.g.dart';

class PhotosViewModel = _PhotosViewModelBase with _$PhotosViewModel;

abstract class _PhotosViewModelBase with Store {
  @observable
  List<PhotosModel>? items;
  @observable
  bool isLoading = false;


  late final INetworkManager manager;
  final Dio dio = Dio();

  _PhotosViewModelBase() {
    manager = Networkmanager(dio: dio);
    fetchItemsFromService();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchItemsFromService() async {
    changeLoading();
    items = await manager.fetchItems();
    changeLoading();
  }
}
