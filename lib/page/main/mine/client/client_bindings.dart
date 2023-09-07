import 'package:get/get.dart';
import 'package:rapicredito/page/main/mine/client/index.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClientCtr>( ClientCtr());
  }
}
