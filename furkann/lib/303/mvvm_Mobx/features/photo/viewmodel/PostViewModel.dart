import 'package:dio/dio.dart';
import '../service/PhotoService.dart';
import 'package:mobx/mobx.dart';

import '../model/PhotoModel.dart';
import '../service/IPhotoService.dart';

part 'PostViewModel.g.dart';

class PostViewModel = _PostviewModelBase with _$PostViewModel;

abstract class _PostviewModelBase with Store {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  @observable
  List<PhotoModel> items = [];
  @observable
  bool isLoading = false;

  late final Dio dio;
  late Iphotoservice servicePhotoservice;

  _PostviewModelBase() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    servicePhotoservice = Photoservice(dio: dio);
    fetchPhotos();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchPhotos() async {
    changeLoading();
    items = await servicePhotoservice.fetchPhotos();
    changeLoading();
  }
}
