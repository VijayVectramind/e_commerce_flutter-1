import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../common_methods/error_exception.dart';
import '../model/url_model.dart';
import '../network/api_base_helper.dart';
import '../network/api_response.dart';
import '../network/endpoints.dart';
import '../services/loader_notifier_service.dart';
import '../services/user_details_service.dart';
import '../utils/enums.dart';
import '../utils/locator.dart';

import '../utils/my_logger.dart';

mixin HeaderObj {
  getHeader(UrlModel urlModel) {
    if (urlModel.urlAuthtypeEnum == UrlAuthtypeEnum.AUTH) {
      return {
        "Content-type": "application/json",
        "Accept": "application/json",
       
       // "Authorization": "Bearer ${locator<UserService>().token}"
      };
    } else {
      return {
        "Content-type": "application/json",
        "Accept": "application/json",
       
      };
    }
  }
}

class Repo with HeaderObj {
  String tag = 'Repo';

// ApiMethodTypesEnums apiMethodTypesEnums,
//       dynamic JsonBody, UrlModel urlModel, file
  Future<dynamic> callApi(
      ApiMethodTypesEnums apiMethodTypesEnums, UrlModel urlModel,
      {dynamic jsonBody, XFile? file}) async {
    try {
      var header = await getHeader(urlModel);
      MyLogger.d('Repo :: header : $header', tag: tag);
      MyLogger.d('Repo :: URL : $baseUrl${urlModel.url}', tag: tag);
      MyLogger.d('Repo :: request data : ${jsonEncode(jsonBody)}', tag: tag);

      locator<LoaderNotifierService>().increment();
      ApiResponse apiResponse;
      switch (apiMethodTypesEnums) {
        case ApiMethodTypesEnums.GET:
          apiResponse = await ApiBaseHelper()
              .get(Uri.parse('$baseUrl${urlModel.url}'), header);
          break;
        case ApiMethodTypesEnums.POST:
          apiResponse = await ApiBaseHelper()
              .post(Uri.parse('$baseUrl${urlModel.url}'), jsonBody, header);
          break;
        case ApiMethodTypesEnums.PUT:
          apiResponse = await ApiBaseHelper()
              .put(Uri.parse('$baseUrl${urlModel.url}'), jsonBody, header);
          break;
        case ApiMethodTypesEnums.PATCh:
          apiResponse = await ApiBaseHelper()
              .patch(Uri.parse('$baseUrl${urlModel.url}'), jsonBody, header);
          break;
        case ApiMethodTypesEnums.DELETE:
          apiResponse = await ApiBaseHelper()
              .delete(Uri.parse('$baseUrl${urlModel.url}'), jsonBody, header);
          break;
        case ApiMethodTypesEnums.POSTFILE:
          apiResponse = await ApiBaseHelper()
              .uploadFile(Uri.parse('$baseUrl${urlModel.url}'), file!);
          break;

        case ApiMethodTypesEnums.GETFILE:
          apiResponse = await ApiBaseHelper()
              .get(Uri.parse('$baseUrl${urlModel.url}'), header);
          break;
      }
      locator<LoaderNotifierService>().decrement();
      return await handleResponse(apiResponse);
    } on SocketException {
      bool result = await InternetConnectionChecker().hasConnection;
      locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception(
          result ? 'Server Error' : 'Please connect to Internet ');
      // handle socket exception
    } on FormatException {
      locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception('Format Exception ');
      // handle Format Exception
    } on HttpException {
      locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception('Http Exception ');
      // handle Http Exception
    } catch (e) {
      locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception(e.toString());
      MyLogger.e('Repo :: ${e.toString()}', tag: tag);
      // handle error
    }
  }

  handleResponse(ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case ApiStatus.SUCCESS:
        return apiResponse.data;
      case ApiStatus.EXCEPTION:
        handleErrorsandExeception(apiResponse.data);
        return null;

      case ApiStatus.UNAUTHORISED:
        handleErrorsandExeception(apiResponse.data);
        // call unauthorised implementaion
        return null;

      case ApiStatus.ERROR:
        handleErrorsandExeception(apiResponse.data);
        return null;
    }
  }

  Future<ApiResponse?> login(
    dynamic jsonBody,
    UrlModel urlModel,
  ) async {
    var header = await getHeader(urlModel);
    MyLogger.d('Repo :: header : $header', tag: tag);
    MyLogger.d('Repo :: URL : $baseUrl${urlModel.url}', tag: tag);
    MyLogger.d('Repo :: request data : ${jsonEncode(jsonBody)}', tag: tag);

    try {
   //   locator<LoaderNotifierService>().increment();
      ApiResponse apiResponse = await ApiBaseHelper()
          .post(Uri.parse('$baseUrl${urlModel.url}'), jsonBody, header);
      // locator<UserService>().token = apiResponse.headers!["authorization"]!;
   //   locator<LoaderNotifierService>().decrement();
      switch (apiResponse.status) {
        case ApiStatus.SUCCESS:
          return apiResponse;
        case ApiStatus.EXCEPTION:
          handleErrorsandExeception(apiResponse.data);
          return null;

        case ApiStatus.UNAUTHORISED:
          handleErrorsandExeception(apiResponse.data);
          // call unauthorised implementaion
          return null;

        case ApiStatus.ERROR:
          handleErrorsandExeception(apiResponse.data);
          return null;
      }
    } on SocketException {
    //  locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception('Socket Exception ');
      // handle socket exception
    } on FormatException {
   //   locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception('Format Exception ');
      // handle Format Exception
    } on HttpException {
    //  locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception('Http Exception ');
      // handle Http Exception
    } catch (e) {
    //  locator<LoaderNotifierService>().decrement();
      handleErrorsandExeception(e.toString());
      // handle error
    }
    return null;
  }

  handleErrorsandExeception(String error) {
    // SmartDialog.show(
    //   backDismiss: true,
    //   clickMaskDismiss: true,
    //   builder: (_) {
    //     return ErrorandExceptionDialog(message: error);
    //   },
    // );
    log("${error}");
  }
}


