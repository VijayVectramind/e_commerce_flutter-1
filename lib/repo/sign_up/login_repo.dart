import 'package:ecommerce_app/network/endpoints.dart';

import '../../model/login/login_request_dto.dart';
import '../../model/login/login_response_dto.dart';
import '../../network/api_response.dart';
import '../repo.dart';

class LoginRepo extends Repo{

 Future<LoginResponseModel?> loginUser(LoginRequestModel loginRequestModel) async {
    ApiResponse? response = await login(loginRequestModel, userLogin);
    if (response != null) {
      LoginResponseModel loginResponseModel =LoginResponseModelFromJson(response.data);
      if (loginResponseModel.success) {
        return loginResponseModel;
      }
      return loginResponseModel;
    }
    return null;
  }
}