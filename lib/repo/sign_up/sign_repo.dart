import '../../model/sign_up/sign_up_request_model.dart';
import '../../model/sign_up/sign_up_response_model.dart';
import '../../network/api_response.dart';
import '../../network/endpoints.dart';
import '../repo.dart';

class SignUpRepo extends Repo{
  Future<SignUpResponseModel?> userSignUp(SignUpRequestModel signUpRequestModel) async {
    ApiResponse? response = await login(signUpRequestModel, userRegistration);
    if (response != null) {
      SignUpResponseModel signUpResponseModel = signUpResponseModelFromJson(response.data);
      return signUpResponseModel;
    }
    return null;
  }
}