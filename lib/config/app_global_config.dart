import 'package:rapicredito/config/app_firebase_init.dart';
import 'package:rapicredito/config/app_get_info_init.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/config/app_system_init.dart';

class AppGlobalConfig {
  static Future init() async {
    await initSystemConfig();
    await initHttp();
    await initGetInfo();
    // await initFireBase();
  }
}
