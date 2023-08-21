import 'package:get/get.dart';
import 'package:rapicredito/page/auth/person/index.dart';

class AuthIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthPersonCtr>(() => AuthPersonCtr());
  }
}
