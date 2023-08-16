
import 'package:rapicredito/net/net_request.dart';
import 'package:get/get.dart';

class BaseGetCtr extends GetxController {
  late NetRequest netRequest;

  @override
  void onInit() {
    super.onInit();
    netRequest = Get.find<NetRequest>();
  }
}
