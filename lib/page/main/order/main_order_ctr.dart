import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MainOrderCtr extends BaseGetCtr {
  MainOrderCtr();

  final state = MainOrderState();
  var refreshController = RefreshController();

  void requestInitData({bool isShowDialog = false}) async {
    if (UserStore.to.hasToken) {
      await _postQueryOrderListRequest(isShowDialog: isShowDialog);
    }
    if (state.isRefresh) {
      refreshController.refreshCompleted();
    }
  }

  Future<void> refreshInfo({bool isShowDialog = false}) async {
    state.isRefresh = true;
    requestInitData(isShowDialog: isShowDialog);
  }

  Future<void> _postQueryOrderListRequest({bool isShowDialog = false}) async {
    Map<String, dynamic> param = getCommonParam();
    if (isShowDialog) {
      Get.showLoading();
    }
    var response =
        await HttpRequestManage.instance.postQueryOrderListRequest(param);
    if (isShowDialog) {
      Get.dismiss();
    }
    if (response.isSuccess()) {
      var netList = response.data ?? [];
      if (ObjectUtil.isEmptyList(netList)) {
        state.loadState = LoadState.empty;
      } else {
        state.dataSource
          ..clear()
          ..addAll(netList);
        state.loadState = LoadState.succeed;
      }
    } else {
      state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  void goToChangeAccountPage() async {
    KeyboardUtils.unFocus();
    await Get.toNamed(PageRouterName.accountPage,
        arguments: {AppConstants.isFromAddAccountKey: false});
  }

  void _openBrowser(String url) async {
    if (!ObjectUtil.isEmptyString(url)) {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Cannot open $url';
      }
    }
  }

  void _goToWebViewPage(String title, String webViewUrl) async {
    KeyboardUtils.unFocus();
    await Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl,
    });
  }
}
