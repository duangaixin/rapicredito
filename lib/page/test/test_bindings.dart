import 'package:get/get.dart';
import 'package:rapicredito/page/test/index.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestCtr>(() => TestCtr());
  }
}
