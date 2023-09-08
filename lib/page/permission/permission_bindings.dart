import 'package:get/get.dart';
import 'package:rapicredito/page/permission/index.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionCtr>(() => PermissionCtr(),fenix: true);
  }
}
