import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  String mToken = '';
 int mUserId=-1;
  bool get hasToken => mToken.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    mToken = StorageService.to.getString(AppConstants.userTokenKey);
    mUserId= StorageService.to.getInt(AppConstants.userIdKey);
  }

  Future<void> setLoginInfo(String token,int userId) async {
    await StorageService.to.setString(AppConstants.userTokenKey, token);
    await StorageService.to.setInt(AppConstants.userIdKey, userId);

    mToken = token;
    mUserId=userId;
  }

  Future<void> loginOut() async {
    if (hasToken) {
      mUserId=-1;
      mToken = '';
      await StorageService.to.clear();

    }
  }

  Future<bool> setAlreadyOpen() {
    return StorageService.to.setBool(AppConstants.isFirstStartKey, true);
  }
}
