import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vonop/models/session/session_credentials.dart';
import 'package:vonop/view/pages/authorize_page/register/authorize_page.dart';

import '../../view/pages/authorize_page/login/authorize_page.dart';
import '../constants/enums/initialize_app_result_type_enum.dart';
import '../init/locator/locator.dart';
import 'notification/firebase_push_notification_service.dart';
import 'provider/form/form_provider.dart';

class Initialize {
  static late FirebasePushNotificationService _notificationService;

  static Future<ResultType> initializeApp(BuildContext context) async {
    if (!(await checkInternetConnection())) return ResultType.NO_INTERNET;

    _notificationService = getIt<FirebasePushNotificationService>();

    _notificationService.addListener(print);

    _notificationService.addListener((msg) {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) {
            print("*" * 50);
            print(msg.data);
            SessionCredentials credentials =
                SessionCredentials(msg.data['project_key'], msg.data['session_key']);
            return registerAuthorizeSheet(context, credentials: credentials);
          });
    });

    await getIt<FirebasePushNotificationService>().initialize();

    String? token = await _notificationService.getToken();
    debugPrint(token);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstLaunch = prefs.getBool('firstLaunch') ?? true;
    if (firstLaunch) {
      return ResultType.FIRST_LAUNCH;
    }

    if (!(await _requestNotificationPermission())) {
      return ResultType.NO_NOTIFICATION_PERMISSION;
    }

    return ResultType.NO_ERROR;
  }

  static Future<bool> checkInternetConnection() async {
    try {
      await InternetAddress.lookup('8.8.8.8');
      return true;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<bool> _requestNotificationPermission() async {
    NotificationSettings settings = await _notificationService.requestPermission();
    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        return true;
      case AuthorizationStatus.denied:
        return false;
      case AuthorizationStatus.notDetermined:
        return false;
      case AuthorizationStatus.provisional:
        return true;
    }
  }
}
