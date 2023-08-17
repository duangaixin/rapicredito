import 'package:get/get.dart';
import 'package:rapicredito/page/main/app_main_ctr.dart';

class AppMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppMainCtr>(() => AppMainCtr());
  }
}
