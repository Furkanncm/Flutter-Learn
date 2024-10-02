import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_viewmodel.dart';
import '../../../../core/constants/enum/http_type_enum.dart';
import '../../../../core/init/network/ICoreDio.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/test_model.dart';

part 'test_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store implements BaseViewmodel {
  late BuildContext _buildContext;

  @observable
  int number = 0;
  @observable
  List<TestModel> items = [];
  Icoredio? coredio = NetworkManager.instance.coreDio;

  @override
  BuildContext setContext(BuildContext context) => _buildContext = context;

  @override
  void init() {}

  @action
  void incrementNumber() {
    number++;
  }

  @action
  Future<List<TestModel>?> fetchItems() async {
    final response = await coredio?.httpEvents<List<TestModel>, TestModel>(
        "path", HttpTypeEnum.GET, TestModel());
    return response;
  }

  @action 
  Future<void> postItem(TestModel model) async {
    final response = await coredio?.httpEvents("path", HttpTypeEnum.POST,data: model, TestModel());
    return response;
    
  }
}
