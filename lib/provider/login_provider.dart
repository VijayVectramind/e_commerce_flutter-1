
import 'package:flutter/material.dart';

import '../common_widgets/catche_error_dilog.dart';
import '../model/login/login_request_dto.dart';
import '../model/login/login_response_dto.dart';
import '../repo/sign_up/login_repo.dart';
import '../utils/my_logger.dart';
import '../utils/prefrence_utils.dart';

class LoginProvider with ChangeNotifier {
 String tag = 'Login Provider';

bool _isLoading =false;

  set isLoading(bool value){
   _isLoading = value;
    notifyListeners();
}

bool get isLoading => _isLoading;




Future<LoginResponseModel?> postLoginData(LoginRequestModel loginRequestModel) async {
    try {
      isLoading =true;
      LoginResponseModel? response =
          await LoginRepo().loginUser(loginRequestModel);
          isLoading=false;
      if (response != null ) {
      return  response;
      }    
    } catch (e) {
      MyLogger.e('login :: ${e.toString()}', tag: tag);
    //  CatcheErrorDialog.showError(e.toString());
    }
     isLoading=false;
    return null;
  }
}