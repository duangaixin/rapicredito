import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';

class MainHomeCtr extends BaseGetCtr {
  MainHomeCtr();

  final state = MainHomeState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

   void goToAuthPage(){
     KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.authPersonPage);
   }

  void refreshInfo() {
    state.isRefresh = true;
    Future.delayed(const Duration(milliseconds: 2000), () {
      refreshController.refreshCompleted();
    });
  }
}
