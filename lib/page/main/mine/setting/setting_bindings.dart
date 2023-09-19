import 'package:get/get.dart';
import 'package:rapicredito/page/main/mine/setting/index.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingCtr>(() => SettingCtr(), fenix: true);
  }
}
