import 'package:get/get.dart';
import 'package:rapicredito/page/loan/first/index.dart';

class FirstLoanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstLoanCtr>(() => FirstLoanCtr());
  }
}
