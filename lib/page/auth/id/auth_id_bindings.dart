import 'package:get/get.dart';
import 'package:rapicredito/page/auth/id/index.dart';

class AuthIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthIdCtr>(() => AuthIdCtr(),fenix: true);
  }
}
