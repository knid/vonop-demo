import 'package:dio/dio.dart';

enum APIErrorType {
  TOKEN_EXPIRED,
  INCORRECT_CREDENTIALS,
  NOT_FOUND,
  PERMISSION_DENIED,
  UNKNOWN,
}

class APIError implements Exception {
  APIErrorType type;
  Response response;

  APIError(this.type, this.response);

  @override
  String toString() {
    return "\nAPIError: $type\nDetail: ${response.data['detail']}\n";
  }
}
