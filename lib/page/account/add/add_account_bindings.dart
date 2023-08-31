import 'package:get/get.dart';
import 'package:rapicredito/page/account/add/index.dart';


class AddAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAccountCtr>(() => AddAccountCtr());
  }
}
