import 'package:vonop/core/constants/enums/http_response_status_enum.dart';

extension HttpResponseExtension on HttpResponeStatus {
  int get code {
    switch (this) {
      case HttpResponeStatus.OK:
        return 200;
      case HttpResponeStatus.CREATED:
        return 201;
      default:
        return 0;
    }
  }
}
