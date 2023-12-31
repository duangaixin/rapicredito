import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';

class MainMineCtr extends BaseGetCtr {
  MainMineCtr();

  final state = MainMineState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    state.phoneNum = StorageService.to.getString(AppConstants.userPhoneKey);
    super.onInit();
  }

  void requestInitData() async {
    if (UserStore.to.hasToken) {
      await _postQueryAuthPersonRequest(isShowDialog: false);
      await _postQueryPhotoInfo();
    }
    if (state.isRefresh) {
      refreshController.refreshCompleted();
    }
  }

  void refreshInfo() async {
    state.isRefresh = true;
    requestInitData();
  }

  Future<void> _postQueryAuthPersonRequest({bool isShowDialog = true}) async {
    if (isShowDialog) {
      Get.showLoading();
    }
    Map<String, dynamic> param = getCommonParam();
    var response =
        await HttpRequestManage.instance.postQueryAuthInfoRequest(param);
    if (isShowDialog) {
      Get.dismiss();
    }
    if (response.isSuccess()) {
      var authInfoBean = response.data;
      state.userName =
          authInfoBean?.pacificCheapMineralCrazyLamb ?? 'RapiCrédito';
    } else {
      NetException.dealAllException(response);
    }
  }

  Future<void> _postQueryPhotoInfo({bool isShowDialog = false}) async {
    if (isShowDialog) {
      Get.showLoading();
    }
    var param = <String, dynamic>{};
    param.addAll(getCommonParam());
    var response = await HttpRequestManage.instance.postQueryPhotoInfo(param);
    if (isShowDialog) {
      Get.dismiss();
    }
    if (response.isSuccess()) {
      var photoBean = response.data;

      var userUrl = photoBean?.dueReligionFoggyCustom ?? '';
      if (state.userImageUrl != userUrl) {
        state.userImageUrl = userUrl;
      }
    } else {
      NetException.dealAllException(response);
    }
  }

  void goToSettingPage() {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.settingPage);
  }

  void goToClientPage() {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.clientPage,
        arguments: {AppConstants.fromPageNameKey: PageRouterName.clientPage});
  }

  void goToChatPage() {
    KeyboardUtils.unFocus();
    MethodChannel channel = const MethodChannel('originInfoPlugin');
    channel.invokeMethod('openChatActivity');
  }

  void goToWebViewPage(String title, String webViewUrl) {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl
    });
  }

  void goToTestPage() {
    Get.toNamed(PageRouterName.testPage);
  }
}
