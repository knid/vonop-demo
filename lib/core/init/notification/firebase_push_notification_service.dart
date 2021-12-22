import 'package:firebase_messaging/firebase_messaging.dart';

import '../../base/service/notification/base_push_notification.dart';

class FirebasePushNotificationService implements BasePushNotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  RemoteMessage _message = const RemoteMessage();
  // StartType _startType = StartType.normal;
  bool initialized = false;
  List<Function> listeners = <Function>[];

  @override
  Future<void> initialize() async {
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onBackgroundMessage((RemoteMessage? message) async {
      _handleMessage(message);
    });
  }

  void _handleMessage(RemoteMessage? message) async {
    if (message != null) {
      _message = message;
      _listen(message);
    }

    initialized = true;
  }

  @override
  Future<String> getData(String key) async {
    // if (!initialized) {
    //   await initialize();
    // }
    return _message.data[key].toString();
  }

  // @override
  // Future<StartType> get startType async {
  //   if (!initialized) {
  //     await initialize();
  //   }
  //   return _startType;
  // }

  @override
  Future<String?> getToken() async {
    // if (!initialized) {
    //   await initialize();
    // }
    return await messaging.getToken();
  }

  @override
  Future<NotificationSettings> requestPermission() async {
    // if (!initialized) {
    //   await initialize();
    // }
    return await messaging.requestPermission();
  }

  @override
  void addListener(Function(RemoteMessage msg) listener) {
    listeners.add(listener);
  }

  void _listen(RemoteMessage message) {
    for (var func in listeners) {
      func(message);
    }
  }
}
