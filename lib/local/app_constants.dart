import 'package:flutter/foundation.dart';

class AppConstants {
  static const bool inProduction = !kProfileMode && kReleaseMode;
  static const String notFirstStartKey = 'not_first_start';
  static const String appLanguageKey = 'app_language';
  static const String userTokenKey = 'user_token';
  static const String userIdKey = 'user_id';
  static const String userPhoneKey = 'user_phone';
  static const String userTestFlagKey = 'user_test_flag';
  static const String useLoginKey = 'user_login';
  static const String webViewTitleKey = 'webView_title';
  static const String webViewUrlKey = 'webView_url';
  static const String isTokenExpired = 'isTokenExpired';
  static const String fromPageNameKey = 'fromPageNameKey';
}
