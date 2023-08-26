import 'package:flutter/foundation.dart';

class AppConstants {
  static const bool inProduction = !kProfileMode && kReleaseMode;
  static const String isFirstStartKey = 'is_first_start';
  static const String appLanguageKey = 'app_language';
  static const String userTokenKey = 'user_token';
  static const String userIdKey = 'user_id';
  static const String useLoginKey = 'user_login';
  static const String webViewTitleKey = 'webView_title';
  static const String webViewUrlKey = 'webView_url';

  static const String fromPageNameKey = 'fromPageNameKey';
}
