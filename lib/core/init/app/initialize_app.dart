import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import '../../init/locator/locator.dart';

Future<void> initializeApp() async {
  await Firebase.initializeApp();
  setupLocator();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
