enum BaseErrorType { UNKNOWN }

class BaseError implements IErrorModel<BaseErrorType> {
  @override
  int? code;

  @override
  String? message;

  @override
  StackTrace? stackTrace;

  @override
  BaseErrorType? type;

  BaseError({this.code, this.message, this.type}) {
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

abstract class IErrorModel<T> implements Exception {
  String? message;
  int? code;
  T? type;
  StackTrace? stackTrace;
}
