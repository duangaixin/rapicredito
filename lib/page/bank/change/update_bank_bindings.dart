import 'package:get/get.dart';
import 'package:rapicredito/page/bank/change/index.dart';


class UpdateBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateBankCtr>(() => UpdateBankCtr());
  }
}
