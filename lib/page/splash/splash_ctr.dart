import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/splash/index.dart';

class SplashCtr extends BaseGetCtr {
  final state = SplashState();

  @override
  void onInit() {
    super.onInit();
    if (UserStore.to.isFirstStart) {
      for (var image in state.guideList) {
        precacheImage(AssetImage(image), Get.context!);
      }
    }
  }
}
