import 'package:get/get.dart';
import 'package:rapicredito/page/result/repayment/index.dart';

class RepaymentResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepaymentResultCtr>(() => RepaymentResultCtr(), fenix: true);
  }
}
