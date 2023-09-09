import 'package:get/get.dart';
import 'package:rapicredito/page/account/change/index.dart';

class ChangeAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeAccountCtr>(() => ChangeAccountCtr(), fenix: true);
  }
}
