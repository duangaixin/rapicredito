import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/router/page_router_name.dart';

class MainMineCtr extends BaseGetCtr {
  MainMineCtr();

  final state = MainMineState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();

    state.phoneNum = StorageService.to.getString(AppConstants.userPhoneKey);

  }

  void setPhone(){

  }


  @override
  void onReady() {
    super.onReady();
  }

  void refreshInfo() {}

  void goToSettingPage() {
    Get.toNamed(PageRouterName.settingPage);
  }

  void goToClientPage() {
    Get.toNamed(PageRouterName.clientPage);
  }

  void goToWebViewPage(String title, String webViewUrl) {
    Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl
    });
  }



}
