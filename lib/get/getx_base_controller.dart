
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:get/get.dart';

class BaseGetCtr extends GetxController {
  late HttpRequestManage requestManage;

  @override
  void onInit() {
    super.onInit();
    requestManage = Get.find<HttpRequestManage>();
  }
}
