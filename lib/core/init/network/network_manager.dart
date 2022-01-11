import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vonop/core/constants/enums/api_error_enum.dart';

//import '../../constants/enums/locale_keys_enum.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late final Dio dio;
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'http://192.168.1.111:9000',
      headers: {
        HttpHeaders.authorizationHeader:
            'Token 10d8d81572a77bf174ea2f6758524ffa9b007ccc'
      },
      connectTimeout: 1000 * 10,
    );
    dio = Dio(baseOptions);
  }

  static handleError(Object e) {
    if (e is DioError) {
      final Response? response = (e).response;
      if (response != null) {
        final rawData = response.data;
        if (rawData['detail'] == 'Incorrect authentication credentials.') {
          throw APIError(APIErrorType.INCORRECT_CREDENTIALS, response);
        }
      }
    }
  }
}
