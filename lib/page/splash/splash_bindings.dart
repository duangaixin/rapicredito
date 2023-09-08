import 'package:get/get.dart';
import 'package:rapicredito/page/splash/index.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashCtr>(SplashCtr());
  }
}
