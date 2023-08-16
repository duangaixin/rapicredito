import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/lang/en_us.dart';
import 'package:rapicredito/lang/zh_hans.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:get/get.dart';


class LanguageStore extends GetxController {
  static LanguageStore get to => Get.find();

  int languageType = 1;

  Locale? get locale {
    switch (languageType) {
      case 0:
        return const Locale('zh', 'Hans');
      case 1:
        return const Locale('en', 'US');
    }
    return const Locale('en', 'US');
  }

  void setLocal(Locale locale) {
    if (locale == const Locale('zh', 'Hans')) {
      StorageService.to.setInt(AppConstants.appLanguageKey, 0);
    } else if (locale == const Locale('en', 'US')) {
      StorageService.to.setInt(AppConstants.appLanguageKey, 1);
    } else {
      StorageService.to.setInt(AppConstants.appLanguageKey, 1);
    }
    updateLocal();
  }

  void updateLocal() {
    languageType = StorageService.to.getInt(AppConstants.appLanguageKey);
    Get.updateLocale(locale!);
  }

  @override
  void onInit() {
    super.onInit();
    languageType = StorageService.to.getInt(AppConstants.appLanguageKey);
  }
}

class Message extends Translations {
  static Locale? get locale => LanguageStore.to.locale;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_Hans': zhHans,
      };
}
