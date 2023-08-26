import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/login/index.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class LoginCtr extends BaseGetCtr {
  final state = LoginState();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController codeCtr = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void onInit() {
    super.onInit();
    state.isInitClick = true;
    codeCtr.addListener(_btnCanClick);
  }

   void _btnCanClick(){
     state.btnDisableClick=ObjectUtil.isEmptyString(codeCtr.text);
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
    var param = <String, String>{};
    var userId = StorageService.to.getString(AppConstants.userIdKey);
    param['madUnableBackacheCanal'] = '204';
    param['terminalDifferentActionFatFountain'] = userId;
    param['dailyFortuneQuantity'] = '0.0,0.0';
    param['contraryScientificRightNone'] = 'es';
    param['swiftMeansEitherPine'] = phoneCtr.text;
    var response = await HttpRequestManage.instance.postSendCodeRequest(param);

    if (response.isSuccess()) {
    } else {
      ProgressHUD.showError('');
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