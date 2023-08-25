import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/permission/index.dart';
import 'package:rapicredito/router/page_router_name.dart';


class PermissionCtr extends BaseGetCtr {
  final state = PermissionState();

  @override
  void onInit() {
    super.onInit();
  }

  void goToMainPage() {
    Get.offAndToNamed(PageRouterName.mainPage);
  }

  void applyPermission() async {
    await Permission.sms.request();
    await Permission.contacts.request();
    await Permission.camera.request();
    goToMainPage();
  }
}
