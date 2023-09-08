import 'package:get/get.dart';
import 'package:rapicredito/page/loan/index.dart';

class LoanMoneyDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanMoneyDateCtr>(() => LoanMoneyDateCtr(),fenix: true);
  }
}
