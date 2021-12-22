import 'package:dio/dio.dart';

//import '../../constants/enums/locale_keys_enum.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  Dio? dio;
  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: 'http://192.168.1.20:9000/',
        headers: {
          'Authorization':
              'LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)'
        });
    dio = Dio(baseOptions);
  }
}
