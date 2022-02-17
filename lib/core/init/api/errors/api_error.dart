import '../../../base/model/base_error.dart';
import 'error_type_enum.dart';

class APIError implements IErrorModel<APIErrorType> {
  @override
  int? code;

  @override
  String? message;

  @override
  APIErrorType? type;

  @override
  StackTrace? stackTrace;

  APIError({this.code, this.message, this.type}) {
    stackTrace = StackTrace.current;
  }

  @override
  String toString() {
    var msg = "\nAPIError: [$type]";
    msg += "\nCode: $code";
    msg += "\nMessage: $message";
    msg += "\nStack Trace: $stackTrace";
    return msg;
  }
}
