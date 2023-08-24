import 'package:get/get.dart';
import 'package:rapicredito/page/bank/add/index.dart';


class AddBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBankCtr>(() => AddBankCtr());
  }
}
