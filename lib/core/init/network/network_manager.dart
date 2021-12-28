import 'package:dio/dio.dart';

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
      baseUrl: 'http://192.168.1.104:9000',
      headers: {
        'Authorization': 'Token 888230bb7ea2624a4c2e41c3c09b74bb8ab479f6'
      },
      connectTimeout: 3 * 1000,
    );
    dio = Dio(baseOptions);
  }
}
