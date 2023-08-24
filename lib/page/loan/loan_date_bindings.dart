import 'package:get/get.dart';
import 'package:rapicredito/page/loan/index.dart';

class LoanDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanDateCtr>(() => LoanDateCtr());
  }
}
