import 'package:dio/dio.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/service/PhotoService.dart';
import 'package:mobx/mobx.dart';

import 'package:furkann/303/mvvm_Mobx/features/photo/model/PhotoModel.dart';
import 'package:furkann/303/mvvm_Mobx/features/photo/service/IPhotoService.dart';

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
