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

  void changeChinese() {
    LanguageStore.to.setLocal(const Locale('zh', 'CN'));
  }

  void changeEs() {
    LanguageStore.to.setLocal(const Locale('es', 'CO'));
  }

  void logout() async{
     await UserStore.to.loginOut();
     var mainCtr = Get.find<AppMainCtr>();
     mainCtr.dealNavBarTap(0);
      var mainHomeCtr = Get.find<MainHomeCtr>();
      if(mainHomeCtr.initialized){
        mainHomeCtr.mainHomeState.overdueStatus = -1;
      }
      Get.back();
  }
}
