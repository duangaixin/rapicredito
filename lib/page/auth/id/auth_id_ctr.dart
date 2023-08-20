
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/utils/screen_util.dart';


class AuthIdCtr extends BaseGetCtr {
  final state = AuthPersonState();

  @override
  void onInit() {
    super.onInit();
  state.imageWidth=   ScreenUtil.getScreenH(Get.context!)-32-10-1;
  }
}
