import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/login/index.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class LoginCtr extends BaseGetCtr {
  final state = LoginState();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController codeCtr = TextEditingController();
  StreamSubscription? _subscription;
  bool isRootPage=false;
  @override
  void onInit() {
    super.onInit();
   var param= Get.arguments;
   if(param!=null&&param is Map){
      if(!ObjectUtil.isEmptyMap(param)){
        if(param.containsKey(AppConstants.isRootPage)){
          isRootPage=param[AppConstants.isRootPage];
        }
      }
   }
    state.isInitClick = true;
    codeCtr.addListener(_btnCanClick);

  }

  void _btnCanClick() {
    state.btnDisableClick = ObjectUtil.isEmptyString(codeCtr.text);
  }

  void _startTimer() {
    state.timeEnd = 60;
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
        .take(state.totalSecond)
        .listen((int i) {
      state.timeEnd = state.totalSecond - i - 1;
    });
  }

  void postSendCodeRequest() async {
    _startTimer();
    var param = <String, dynamic>{};
    param['swiftMeansEitherPine'] = phoneCtr.text.strRvSpace();
    param.addAll(getCommonParam());
    Get.showLoading();
    var response = await HttpRequestManage.instance.postSendCodeRequest(param);
    Get.showLoading();
    if (response.isSuccess()) {
      var codeStr = response.data ?? '';
      ProgressHUD.showSuccess(codeStr);
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  void postLoginRequest() async {
    _startTimer();
    var param = <String, dynamic>{};

    ///phoneNo
    param['swiftMeansEitherPine'] = phoneCtr.text.strRvSpace();

    ///smsCode
    param['littlePenfriendCompressedFlightManager'] = codeCtr.text.strRvSpace();

    ///gaid
    param['quickUncertainLuggageUglyGoose'] =
        '00000000-0000-0000-0000-000000000000';

    ///appInstanceId
    param['aliveCanteenSteadyPioneer'] = '00000000000000000000000000000000';
    param.addAll(getCommonParam());
    Get.showLoading();
    var response = await HttpRequestManage.instance.postLoginRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var loginInfoBean = response.data;
      var token = loginInfoBean?.darkPlentyNervousHandbag ?? '';
      var userId = loginInfoBean?.terminalDifferentActionFatFountain ?? -1;
      var firstRegister = loginInfoBean?.cheapFenceScholarEverydayClinic ?? '0';
      var testFirstRegister =
          loginInfoBean?.delightedGooseFacialUnmarriedHamburger ?? 0;
      await UserStore.to.setLoginInfo(token, userId);

      var mainHomeCtr = Get.find<MainHomeCtr>();
      mainHomeCtr.refreshInfo();
      if(isRootPage){
       Get.toNamed(PageRouterName.mainPage);
      }else{
        Get.back();
      }

    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    phoneCtr.dispose();
    codeCtr.dispose();
    super.onClose();
  }
}
