import '../../base/model/network_model.dart';
import '../../constants/enum/http_type_enum.dart';

abstract class Icoredio {
  Future<R?> httpEvents<R, T extends NetworkModel>(
      String path, HttpTypeEnum type, T model,
      {dynamic data});
}
