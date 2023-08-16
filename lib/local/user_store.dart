import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  bool isLogin = false;
  bool isFirstStart = false;
  String token = '';

  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    isFirstStart = StorageService.to.getBool(AppConstants.isFirstStartKey);
    token = StorageService.to.getString(AppConstants.userTokenKey);
    isLogin = StorageService.to.getBool(AppConstants.useLoginKey);
  }

  void setToken(String value) async {
    await StorageService.to.setString(AppConstants.userTokenKey, value);
    await StorageService.to.setBool(AppConstants.useLoginKey, true);
    token = value;
    isLogin = true;
  }

  Future<void> loginOut() async {
    if (isLogin) {
      await StorageService.to.clear();
      isLogin = false;
      token = '';
    }
  }

  Future<bool> setAlreadyOpen() {
    return StorageService.to.setBool(AppConstants.isFirstStartKey, true);
  }
}
