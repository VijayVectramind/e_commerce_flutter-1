import 'dart:developer';
import 'package:flutter/material.dart';

import '../common_widgets/catche_error_dilog.dart';
import '../model/sign_up/sign_up_request_model.dart';
import '../model/sign_up/sign_up_response_model.dart';
import '../repo/sign_up/sign_repo.dart';
import '../utils/my_logger.dart';

class SignUpProvider with ChangeNotifier {
 String tag = 'SignUp  viewModel';

bool _isLoading=false;

 set isLoading(bool value){
_isLoading=value;
notifyListeners();
 }

 bool get isLoading => _isLoading; 


Future<SignUpResponseModel?> postRegisterData(BuildContext context,SignUpRequestModel signUpRequestModel) async {
    try {
      isLoading =true;
      SignUpResponseModel? response = await SignUpRepo().userSignUp(signUpRequestModel);
          isLoading=false;
      if (response != null ) {
      return  response;
      }    
    } catch (e) {
      MyLogger.e('postRegisterData :: ${e.toString()}', tag: tag);
      //CatcheErrorDialog.showError(e.toString());
    
    }
    isLoading=false;
    return null;
  }
}