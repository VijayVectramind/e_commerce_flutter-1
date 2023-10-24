import 'dart:convert';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import '../utils/enums.dart';
import '../utils/my_logger.dart';
import 'api_response.dart';

class ApiBaseHelper {
  Future<ApiResponse> get(Uri url, Map<String, String> headers) async {
    final response = await http.get(url, headers: headers);

    return await _returnResponse(response);
  }

  Future<ApiResponse> uploadFile(Uri url, XFile file) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "tranId": "UPLOAD_DOCUMENT_FILE",
      "Content-type": "multipart/form-data",
    };

    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({});
    request.headers.addAll(headers);

    List<int> list = await file.readAsBytes();
    /// after compression of image size we will not get updated file path 

    request.files.add(http.MultipartFile.fromBytes('file', list, filename: file.name));
    /* if (kIsWeb) {
      request.files.add(http.MultipartFile.fromBytes('file', list, filename: file.name));
    } else {
      request.files.add(await http.MultipartFile.fromPath('file', file.path, filename: file.name));
    } */

    var streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return await _returnResponse(response);
  }

  Future<ApiResponse> post(Uri url, dynamic payload, Map<String, String> headers) async {
    final response = await http.post(url, headers: headers, body: jsonEncode(payload));
    log(response.body);
    return await _returnResponse(response);
  }

  Future<ApiResponse> delete(Uri url, dynamic payload, Map<String, String> headers) async {
    final response = await http.delete(url, body: jsonEncode(payload), headers: headers);
    return await _returnResponse(response);
  }

  Future<ApiResponse> patch(Uri url, dynamic payload, Map<String, String> headers) async {
    final response = await http.patch(url, body: jsonEncode(payload), headers: headers);
    return await _returnResponse(response);
  }

  Future<ApiResponse> put(Uri url, dynamic payload, Map<String, String> headers) async {
    final response = await http.put(url, headers: headers, body: jsonEncode(payload));

    return await _returnResponse(response);
  }

  dynamic _returnResponse(http.Response response) async {
    MyLogger.d('Response :: ${utf8.decode(response.bodyBytes)}', tag: 'Api Helper');

    switch (response.statusCode) {
      case 200:
        var result = utf8.decode(response.bodyBytes);
        return ApiResponse(status: ApiStatus.SUCCESS, data: result, headers: response.headers);
      case 201:
        final result = utf8.decode(response.bodyBytes);
        return ApiResponse(status: ApiStatus.SUCCESS, data: result);
      case 400:
        return ApiResponse(status: ApiStatus.ERROR, data: "BadRequest: ${response.statusCode}");
      case 401:
        return ApiResponse(status: ApiStatus.UNAUTHORISED, data: "Unauthorised.StatusCode : ${response.statusCode}");
      case 403:
        return ApiResponse(status: ApiStatus.UNAUTHORISED, data: "Unauthorised.StatusCode : ${response.statusCode}");
      case 404:
        return ApiResponse(status: ApiStatus.ERROR, data: "Path Not Found : ${response.statusCode}");
      case 408:
        return ApiResponse(status: ApiStatus.ERROR, data: "Timeout.StatusCode : ${response.statusCode}");
      case 500:
      case 501:
      case 502:
        return ApiResponse(status: ApiStatus.ERROR, data: "Error occured while Communication with Server with StatusCode : ${response.statusCode}");

      default:
        return ApiResponse(status: ApiStatus.ERROR, data: "Error occured while Communication with Server with StatusCode : ${response.statusCode}");
    }
  }
}
