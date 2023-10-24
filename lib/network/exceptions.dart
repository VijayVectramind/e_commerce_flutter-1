
class AppException implements Exception{
  final _message;

  AppException([this._message]);

  @override
  String toString() {
    return "$_message";
  }
}

class GeneralException extends AppException{
  GeneralException(String message):super(message);
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message);
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message);
}

class BadUriException extends AppException {
  BadUriException([String? message]) : super(message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message);
}

class DuplicateEntryException extends AppException {
  DuplicateEntryException([String? message]) : super(message);
}

class FileNotSelectedException extends AppException {
  FileNotSelectedException([String? message]) : super(message);
}

class ImageSizeException extends AppException {
  ImageSizeException([String? message]) : super(message);
}

class DimensionException extends AppException {
  DimensionException([String? message]) : super(message);
}