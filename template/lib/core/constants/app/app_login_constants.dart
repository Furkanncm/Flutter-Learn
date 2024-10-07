import 'package:template/view/authentication/test/view/test2_view.dart';
import 'package:template/view/product/advanceLogin/model/cubit_login_model.dart';
import 'package:template/view/product/advanceLogin/view/cubit_login_view.dart';

import '../../init/language/locale_keys.g.dart';

class AppLoginConstants {
  static List<CubitLoginModel> models = [
    CubitLoginModel(title: LocaleKeys.login, page: const CubitLoginView()),
    CubitLoginModel(title: LocaleKeys.register, page: const Test2View()),
  ];
}
