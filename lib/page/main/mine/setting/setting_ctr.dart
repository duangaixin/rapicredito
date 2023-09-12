import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/local/language_store.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:rapicredito/page/main/mine/setting/index.dart';

class SettingCtr extends BaseGetCtr {
  final state = SettingState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeChinese() {
    LanguageStore.to.setLocal(const Locale('zh', 'CN'));
  }

  void changeEs() {
    LanguageStore.to.setLocal(const Locale('es', 'CO'));
  }

  void logout() {
    UserStore.to.loginOut();
    var mainHomeCtr = Get.find<MainHomeCtr>();
    mainHomeCtr.state.overdueStatus = -1;
    var mainCtr = Get.find<AppMainCtr>();
    mainCtr.dealNavBarTap(0);
    Get.back();
  }
}
