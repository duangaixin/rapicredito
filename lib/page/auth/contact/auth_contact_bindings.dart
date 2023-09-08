import 'package:get/get.dart';
import 'package:rapicredito/page/auth/contact/auth_contact_ctr.dart';

class AuthContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthContactCtr>(() => AuthContactCtr(),fenix: true);
  }
}
