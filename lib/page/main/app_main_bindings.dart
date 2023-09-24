import 'package:get/get.dart';
import 'package:rapicredito/page/main/app_main_ctr.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/order/main_order_ctr.dart';

class AppMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppMainCtr>(AppMainCtr(),permanent: true);
    Get.put<MainHomeCtr>(MainHomeCtr(),permanent: true);
    Get.put<MainOrderCtr>(MainOrderCtr(),permanent: true);
    Get.put<MainMineCtr>(MainMineCtr(),permanent: true);
  }
}
