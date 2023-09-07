import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/permission/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';

class PermissionCtr extends BaseGetCtr {
  final state = PermissionState();

  @override
  void onInit() {
    super.onInit();
  }

  void goToMainPage() {
    KeyboardUtils.unFocus();
    Get.offAndToNamed(PageRouterName.mainPage);
  }

  void applyPermission() async {
    await Permission.location.request();
    await Permission.calendar.request();
    await Permission.camera.request();
    await Permission.sms.request();
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
