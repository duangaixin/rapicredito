import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/local/language_store.dart';
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
}
