import 'package:get/get.dart';
import 'package:rapicredito/page/bank/index.dart';

class SelectBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectBankCtr>(() => SelectBankCtr());
  }
}
