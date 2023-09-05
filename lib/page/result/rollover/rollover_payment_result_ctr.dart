import 'dart:async';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/result/rollover/rollover_payment_result_state.dart';

class RolloverPaymentResultCtr extends BaseGetCtr {
  final state = RolloverPaymentResultState();
  StreamSubscription? _subscription;

  @override
  void onReady() {
    super.onReady();
    _startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    _subscription?.cancel();
  }

  void _startTimer() {
    state.timeEnd = 5;
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
        .take(state.totalSecond)
        .listen((int i) {
      state.timeEnd = state.totalSecond - i - 1;
      if (state.timeEnd <= 0) {
        Get.back();
      }
    });
  }
}
