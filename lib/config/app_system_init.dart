import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapicredito/utils/log_utils.dart';
import 'package:get/get_utils/get_utils.dart';

Future<void> initSystemConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await setSystemUi();
}

Future<void> setSystemUi() async {
  if (GetPlatform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
