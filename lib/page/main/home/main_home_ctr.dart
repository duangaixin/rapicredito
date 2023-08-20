import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/main/home/index.dart';

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

  void refreshInfo() {
    state.isRefresh = true;
    Future.delayed(Duration(milliseconds: 2000), () {
      refreshController.refreshCompleted();
    });
  }
}
