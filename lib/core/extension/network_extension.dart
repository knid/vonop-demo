import '../../core/constants/enums/http_request_enum.dart';

extension NetworkTypeExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      case HttpTypes.UPDATE:
        return 'UPDATE';
      case HttpTypes.DELETE:
        return 'DELETE';
      default:
        return 'ERROR';
    }
  }
}
