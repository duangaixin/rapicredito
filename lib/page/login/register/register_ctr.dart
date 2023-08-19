import 'dart:async';

import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/login/register/register_state.dart';

class RegisterCtr extends BaseGetCtr {
  final state = RegisterState();
  StreamSubscription? _subscription;

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() {
    state.timeEnd = 60;
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
        .take(state.totalSecond)
        .listen((int i) {
      state.timeEnd = state.totalSecond - i - 1;
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
