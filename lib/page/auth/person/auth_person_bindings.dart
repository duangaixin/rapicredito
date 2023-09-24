import 'package:get/get.dart';
import 'package:rapicredito/page/auth/person/index.dart';

class AuthPersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthPersonCtr>(AuthPersonCtr());
    // Get.lazyPut<AuthPersonCtr>(() => AuthPersonCtr(),fenix: true);
  }
}
