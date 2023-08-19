import 'package:get/get.dart';
import 'package:rapicredito/page/login/register/index.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCtr>(() => RegisterCtr());
  }
}
