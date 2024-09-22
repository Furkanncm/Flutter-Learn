import 'package:mobx/mobx.dart';
import 'package:template/core/init/network/network_manager.dart';
import 'package:template/view/authentication/test/model/test_model.dart';
part 'test_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  @observable
  int number = 0;
  @observable
  List<TestModel> items = [];
  NetworkManager networkManager = NetworkManager.instance;

  @action
  void incrementNumber() {
    number++;
  }

  @action
  Future<void> fetchItems() async {
    items = await networkManager.dioGetItem<TestModel>(
      "todos/1",
      TestModel(),
    );
  }
}
