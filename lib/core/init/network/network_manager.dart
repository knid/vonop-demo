import 'dart:io';

import 'package:dio/dio.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../api/errors/api_error.dart';
import '../api/errors/error_type_enum.dart';
import '../../extension/network_extension.dart';
import 'options.dart';
import 'core_dio.dart';

//import '../../constants/enums/locale_keys_enum.dart';

class NetworkManager {
  late final Dio dio;
  late final CoreDio coreDio;

  NetworkManager() {
    dio = Dio(baseNetworkManagerOptions);
    coreDio = CoreDio(baseNetworkManagerOptions);
  }

  static handleError(Object e) {
    if (e is DioError) {
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 404) {
          throw APIError(
            code: e.response?.statusCode,
            type: APIErrorType.NOT_FOUND,
            message: e.response?.data['detail'],
          );
        }
      } else if (e.type == DioErrorType.other) {
        if (e.message.contains("SocketException")) {
          print(e);
          throw "int yok";
        }
        print(e);
      }
    }
  }
}
