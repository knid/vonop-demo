import 'package:dio/dio.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class ICoreDio {
  Future<R> makeRequest<R, T extends IBaseModel>(String path,
      {data,
      required HttpTypes method,
      required T parseModel,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress});
}
