import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/mine/index.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  String mToken = '';
  int mUserId = -1;
  String mUserPhone = '';

  bool get hasToken => mToken.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    mToken = StorageService.to.getString(AppConstants.userTokenKey);
    mUserId = StorageService.to.getInt(AppConstants.userIdKey);
    mUserPhone = StorageService.to.getString(AppConstants.userPhoneKey);
  }

  Future<void> setLoginInfo(String token, int userId, String userPhone) async {
    await StorageService.to.setString(AppConstants.userTokenKey, token);
    await StorageService.to.setInt(AppConstants.userIdKey, userId);
    await StorageService.to.setString(AppConstants.userPhoneKey, userPhone);

    mToken = token;
    mUserId = userId;
    mUserPhone = userPhone;
    // var mineCtr = Get.find<MainMineCtr>();
    // mineCtr.refreshInfo();
  }

  Future<void> loginOut() async {
    if (hasToken) {
      mUserId = -1;
      mToken = '';
      mUserPhone = '';
      await StorageService.to.clear();
    }
  }

  Future<bool> setAlreadyOpen() {
    return StorageService.to.setBool(AppConstants.isFirstStartKey, true);
  }
}
