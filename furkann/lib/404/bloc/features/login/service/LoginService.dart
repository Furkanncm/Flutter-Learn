import '../model/login_model.dart';
import 'ILoginService.dart';
import 'ServiceEnpoints.dart';
import '../../../../../model/token_model.dart';

class Loginservice extends Iloginservice {
  Loginservice({required super.dio});

  @override
  Future<TokenModel?> login(LoginModel loginmodel) async {
    final response =
        await dio.post("${ServiceEnpoints.login.getPath}", data: loginmodel);
    if (response.statusCode == 200) {
       return TokenModel.fromJson(response.data);  
    }
    return null;
  }
}
