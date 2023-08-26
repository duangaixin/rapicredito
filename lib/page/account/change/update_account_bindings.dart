import 'package:get/get.dart';
import 'package:rapicredito/page/account/change/index.dart';



class UpdateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAccountCtr>(() => UpdateAccountCtr());
  }
}
