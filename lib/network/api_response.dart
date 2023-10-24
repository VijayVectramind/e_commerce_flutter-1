import '../utils/enums.dart';

class ApiResponse {
  ApiStatus status;
  dynamic data;

  Map<String, String>? headers;
  ApiResponse({required this.status, this.data, this.headers});
}
