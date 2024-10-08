import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/viewmodel/base_viewmodel.dart';
import '../../../core/constants/enum/http_type_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import '../../authentication/test/model/test_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store implements BaseViewmodel {
  late BuildContext _buildContext;
  Icoredio? coreDio = NetworkManager.instance.coreDio; // Nullable oldu

  @observable
  List<TestModel> items = [];

  @override
  void setContext(BuildContext context) {
    _buildContext = context;
  }

  @override
  void init() {}

  @action
  Future<List<TestModel>> fetchItems() async {
    items = await coreDio?.httpEvents("todos/1", HttpTypeEnum.GET, TestModel());
    return items;
  }
}
