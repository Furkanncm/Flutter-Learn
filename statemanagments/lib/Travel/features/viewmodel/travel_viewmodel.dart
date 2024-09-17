import 'package:mobx/mobx.dart';
import '../model/travel_model.dart';
import '../service/IService.dart';
part 'travel_viewmodel.g.dart';

class TravelViewModel = _TravelViewModelBase with _$TravelViewModel;

abstract class _TravelViewModelBase with Store {
  _TravelViewModelBase({required this.service}) {
    fetchItems();
  }

  @observable
  bool isLoading = false;
  @observable
  bool isVisibleTop = true;
  @observable
  bool isVisibleBottom = true;
  @observable
  List<TravelModel> items = [];
  final Iservice service;
  @observable
  List<TravelModel> marked = [];

  @action
  Future<void> fetchItems() async {
    changeLoading();
    items = await service.fetchItems() ?? [];
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  changeIsVisibleTop() {
    isVisibleTop = !isVisibleTop;
  }

  @action
  changeIsVisibleBottom() {
    isVisibleBottom = !isVisibleBottom;
  }

  @action
  void saveModel(TravelModel model) {
    marked.add(model);
  }
}
