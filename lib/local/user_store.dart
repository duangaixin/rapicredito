import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  String mToken = '';
  int mUserId = -1;
  String mUserPhone = '';
  String mUserEmail = '';

  bool get hasToken => mToken.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    mToken = StorageService.to.getString(AppConstants.userTokenKey);
    mUserId = StorageService.to.getInt(AppConstants.userIdKey);
    mUserPhone = StorageService.to.getString(AppConstants.userPhoneKey);
    mUserEmail = StorageService.to.getString(AppConstants.userEmailKey);
  }

  Future<void> setLoginInfo(String token, int userId, String userPhone) async {
    await StorageService.to.setString(AppConstants.userTokenKey, token);
    await StorageService.to.setInt(AppConstants.userIdKey, userId);
    await StorageService.to.setString(AppConstants.userPhoneKey, userPhone);
    mToken = token;
    mUserId = userId;
    mUserPhone = userPhone;
  }

  Future<void> loginOut() async {
    if (hasToken) {
      mUserId = -1;
      mToken = '';
      mUserPhone = '';
      await StorageService.to.remove(AppConstants.appInstanceIdKey);
      await StorageService.to.remove(AppConstants.isManyProductKey);
      await StorageService.to.remove(AppConstants.currentUserIdKey);
      await StorageService.to.remove(AppConstants.gidKey);
      await StorageService.to.remove(AppConstants.uuidKey);
      await StorageService.to.remove(AppConstants.userTokenKey);
      await StorageService.to.remove(AppConstants.userIdKey);
      await StorageService.to.remove(AppConstants.userPhoneKey);
      await StorageService.to.remove(AppConstants.userEmailKey);
    }
  }

  Future<bool> setAlreadyOpen() {
    return StorageService.to.setBool(AppConstants.notFirstStartKey, true);
  }
}
