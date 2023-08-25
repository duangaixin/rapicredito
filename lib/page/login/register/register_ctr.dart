import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/page/login/register/register_state.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class RegisterCtr extends BaseGetCtr {
  final state = RegisterState();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController codeCtr = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void onInit() {
    super.onInit();
    state.isInitClick = true;
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
    param[''] = '';
    var response = await HttpRequestManage.instance.postSendCodeRequest(param);

    if (response.isSuccess()) {
    } else {
      ProgressHUD.showError('');
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
