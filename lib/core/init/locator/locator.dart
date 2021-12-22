import 'package:get_it/get_it.dart';

import '../notification/firebase_push_notification_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<FirebasePushNotificationService>(
      FirebasePushNotificationService());
}
