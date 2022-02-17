import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:vonop/core/init/api/errors/api_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'ICoreDio.dart';
import '../../extension/network_extension.dart';

import '../../base/model/base_error.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  // ignore: overridden_fields
  late BaseOptions options;

  CoreDio(this.options) {
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<R> makeRequest<R, T extends IBaseModel>(String path,
      {data,
      required HttpTypes method,
      required T parseModel,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    final response = await request(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options ?? Options(method: method.rawValue),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.noContent:
        final responseBody = response.data;
        return _responseParser<R, T>(parseModel, responseBody);
      default:
        throw BaseError(code: response.statusCode, message: response.data['detail']);
    }
  }

  R _responseParser<R, T>(IBaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map<String, dynamic>) {
      return model.fromJson(data) as R;
    }
    return data as R;
  }
}
