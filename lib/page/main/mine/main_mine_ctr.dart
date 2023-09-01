import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/router/page_router_name.dart';

class MainMineCtr extends BaseGetCtr {
  MainMineCtr();

  final state = MainMineState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void refreshInfo() async {
    if (UserStore.to.hasToken) {
      await _postQueryAuthPersonRequest(isShowDialog: false);
    }
    refreshController.refreshCompleted();
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
      state.phoneNum = authInfoBean?.pureDollFailure ?? '+57 954-566670';
      //authInfoBean?.communistBuddhistZooExtraCellar??'';
      state.userName =
          authInfoBean?.pacificCheapMineralCrazyLamb ?? 'Ronald Lamb';
    } else {
      NetException.toastException(response);
    }
  }

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
