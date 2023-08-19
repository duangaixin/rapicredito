import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/main/mine/index.dart';


class MainMineCtr extends BaseGetCtr {
  MainMineCtr();

  final state = MainMineState();
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

  }
}
