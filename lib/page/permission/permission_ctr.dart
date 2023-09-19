import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/permission/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';

class PermissionCtr extends BaseGetCtr {
  final state = PermissionState();

  void goToMainPage() {
    KeyboardUtils.unFocus();
    Get.offAndToNamed(PageRouterName.mainPage);
  }

  void exitApp() async {
    await SystemNavigator.pop();
  }

  void applyPermission() async {
    await Permission.location.request();
    await Permission.calendar.request();
    await Permission.camera.request();
    await Permission.sms.request();
    await Permission.phone.request();
    UserStore.to.setAlreadyOpen();
    goToMainPage();
  }

  void goToWebViewPage(String title, String webViewUrl) {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl
    });
  }
}
