import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vonop/core/init/provider/form/form_provider.dart';

import '../init/locator/locator.dart';
import 'notification/firebase_push_notification_service.dart';
import '../../view/pages/login_register/welcome_page.dart';
import '../constants/enums/initialize_app_result_type_enum.dart';
import 'package:provider/provider.dart';

class Initialize {
  static late FirebasePushNotificationService _notificationService;

  static Future<ResultType> initializeApp(BuildContext context) async {
    if (!(await _checkInternetConnection())) return ResultType.NO_INTERNET;

    _notificationService = getIt<FirebasePushNotificationService>();

    _notificationService.addListener((RemoteMessage? msg) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => WelcomePage())));

    _notificationService.addListener(print);

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

    await context.read<FormProvider>().getAll();
    return ResultType.NO_ERROR;
  }

  static Future<bool> _checkInternetConnection() async {
    try {
      await InternetAddress.lookup('8.8.8.8');
      return true;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<bool> _requestNotificationPermission() async {
    NotificationSettings settings =
        await _notificationService.requestPermission();
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
