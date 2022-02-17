import 'package:get_it/get_it.dart';
import '../network/network_manager.dart';
import '../api/form/api_form_service.dart';

import '../notification/firebase_push_notification_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<NetworkManager>(NetworkManager());
  getIt.registerSingleton<FirebasePushNotificationService>(FirebasePushNotificationService());
  getIt.registerSingleton<APIFormService>(APIFormService());
}
