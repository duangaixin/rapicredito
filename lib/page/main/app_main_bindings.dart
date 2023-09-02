import 'package:get/get.dart';
import 'package:rapicredito/page/main/app_main_ctr.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/order/main_order_ctr.dart';

class AppMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppMainCtr>(AppMainCtr());
    Get.put<MainHomeCtr>(MainHomeCtr());
    Get.put<MainOrderCtr>(MainOrderCtr());
    Get.put<MainMineCtr>(MainMineCtr());
  }
}
