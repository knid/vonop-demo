import 'package:dio/dio.dart';

enum APIErrorType {
  TOKEN_EXPIRED,
  INCORRECT_CREDENTIALS,
  NOT_FOUND,
  PERMISSION_DENIED,
  FORM_NAME_EXIST,
  UNKNOWN,
}

class APIError implements Exception {
  APIErrorType type;
  Response? response;

  APIError(this.type, [this.response]);

  @override
  String toString() {
    String string = "\nAPIError: $type";
    string += response != null
        ? "\nDetail: ${response!.data['detail']}\n"
        : "\n[Response not found]\n";
    return string;
  }
}
