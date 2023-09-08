import 'package:get/get.dart';
import 'package:rapicredito/page/login/index.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginCtr>(LoginCtr());
  }
}
