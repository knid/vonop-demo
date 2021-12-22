import 'package:firebase_messaging/firebase_messaging.dart';

abstract class BasePushNotificationService {
  Future<void> initialize();
  void addListener(Function(RemoteMessage msg) listener);
  Future<String> getData(String key);
  Future<String?> getToken();
  Future<NotificationSettings> requestPermission();
}
