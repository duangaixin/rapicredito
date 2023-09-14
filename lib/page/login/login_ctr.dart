import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/login/index.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class LoginCtr extends BaseGetCtr {
  final state = LoginState();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController codeCtr = TextEditingController();
  StreamSubscription? _subscription;
  bool isTokenExpired = false;

  @override
  void onInit() {
    super.onInit();
    var param = Get.arguments;
    if (param != null && param is Map) {
      if (!ObjectUtil.isEmptyMap(param)) {
        if (param.containsKey(AppConstants.isTokenExpired)) {
          isTokenExpired = param[AppConstants.isTokenExpired];
        }
      }
    }
    state.isInitClick = true;
    phoneCtr.addListener(_btnLoginCanClick);
    phoneCtr.addListener(_btnOptCanClick);
    codeCtr.addListener(_btnLoginCanClick);
  }

  void _btnOptCanClick() {
    state.btnOptDisableClick = ObjectUtil.isEmptyString(phoneCtr.text);
  }

  void _btnLoginCanClick() {
    state.btnLoginDisableClick = ObjectUtil.isEmptyString(phoneCtr.text) ||
        ObjectUtil.isEmptyString(codeCtr.text);
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
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    param['swiftMeansEitherPine'] = phoneCtr.text.strRvSpace();
    param.addAll(getCommonParam());
    Get.showLoading();
    var response = await HttpRequestManage.instance.postSendCodeRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      state.isInitClick = false;
      _startTimer();
      // var codeStr = response.data ?? '';
    } else {
      NetException.dealAllException(response);
    }
  }

  void showTip() {
    if (ObjectUtil.isEmptyString(phoneCtr.text.strRvSpace())) {
      ProgressHUD.showInfo(
          'Por favor, introduzca un número de teléfono correcto');
    }
  }

  void postLoginRequest() async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var phoneNum = phoneCtr.text.strRvSpace();

    ///phoneNo
    param['swiftMeansEitherPine'] = phoneNum;

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
      var testFlag = loginInfoBean?.delightedGooseFacialUnmarriedHamburger ?? 0;
      await StorageService.to.setInt(AppConstants.userTestFlagKey, testFlag);
      await UserStore.to.setLoginInfo(token, userId, phoneNum);
      //await setCrispInfo(testFlag.toString(), phoneNum);
      if (isTokenExpired) {
        Get.toNamed(PageRouterName.mainPage);
      } else {
        Get.back();
      }
      var mainHomeCtr = Get.find<MainHomeCtr>();
      mainHomeCtr.refreshInfo();
    } else {
      NetException.dealAllException(response);
    }
  }

  Future<void> setCrispInfo(String testFlag, String phone) async {
    MethodChannel channel = const MethodChannel('originInfoPlugin');
    var param = <String, String>{};
    param
      ..['testFlag'] = testFlag
      ..['userPhone'] = phone;
    await channel.invokeMethod('setCrispInfo', param);
  }

  @override
  void onClose() {
    _subscription?.cancel();
    phoneCtr.text = '';
    codeCtr.text = '';
    phoneCtr.removeListener(_btnOptCanClick);
    phoneCtr.removeListener(_btnLoginCanClick);
    codeCtr.removeListener(_btnLoginCanClick);
    phoneCtr.dispose();
    codeCtr.dispose();
    super.onClose();
  }
}
