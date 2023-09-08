import 'package:get/get.dart';
import 'package:rapicredito/page/result/rollover/index.dart';

class RolloverPaymentResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RolloverPaymentResultCtr>(() => RolloverPaymentResultCtr(),fenix: true);
  }
}
