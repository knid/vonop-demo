import '../../base/model/base_error.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}
