import 'package:device_identity/device_identity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/permission/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';

class PermissionCtr extends BaseGetCtr {
  final state = PermissionState();

   @override
  void onReady() {
    DeviceInfoChannel.initApp();
    _postAddPointRequest(osType: 'HIRE_SURROUNDING_MINISKIRT');
    super.onReady();
  }

  void goToMainPage() {
    KeyboardUtils.unFocus();
    Get.offAndToNamed(PageRouterName.mainPage);
  }



  void exitApp() async {
    await SystemNavigator.pop();
  }

  void applyPermission() async {
    await Permission.location.request();
    await Permission.calendar.request();
    await Permission.camera.request();
    await Permission.sms.request();
    await Permission.phone.request();
    UserStore.to.setAlreadyOpen();
    goToMainPage();
  }




  void goToWebViewPage(String title, String webViewUrl) {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl
    });
  }

  Future<bool> _postAddPointRequest(
      {String osType = '', String data = ''}) async {
    var param = getCommonParam();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var imei = await DeviceIdentity.imei;
    var deviceId = await PlatformDeviceId.getDeviceId ?? '';
    MethodChannel channel = const MethodChannel('originInfoPlugin');
    var userAgent = await channel.invokeMethod('getUserAgent');
    var versionName = packageInfo.version;
    var versionCode = packageInfo.buildNumber;
    if (ObjectUtil.isEmptyString(imei)) {
      imei = deviceId;
    }
    final deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    if (ObjectUtil.isEmptyString(imei)) {
      var serialNumber = androidInfo.serialNumber;
      imei = serialNumber;
    }
    var osVersion = androidInfo.version.release;
    var model = androidInfo.model;
    var manufacturer = androidInfo.manufacturer;
    var locationStr = StorageService.to.getString(AppConstants.locationKey);

    var gid = await DeviceInfoChannel.getGid();
    await StorageService.to.setString(AppConstants.gidKey, gid ?? '');

    param
      ..['egyptianParcelAboveReceiver'] = osType
      ..['narrowRingHisViolentBoating'] = data
      ..['nearBrownFebruaryNoisyUniversity'] = locationStr
      ..['dailyFortuneQuantity'] = locationStr
      ..['sorryStraightSkillfulTrip'] = manufacturer
      ..['neitherFurnitureLuckNewLetter'] = model
      ..['emptyChainFamousJewel'] = imei
      ..['extraordinaryIndependentCollegeDeal'] = versionName
      ..['literaryMineralFatHillSwiftRobot'] = versionCode
      ..['quickUncertainLuggageUglyGoose'] = gid
      ..['humorousSettlementMistakenBalcony'] = ''
      ..['healthyBoatingCoursebookFiercePermission'] = osVersion
      ..['honestPracticeDeerRecentStone'] = userAgent
      ..['thatQuizInstitutionLeftTraining'] = 'es';

    var response = await HttpRequestManage.instance.postAddPointRequest(param);
    if (response.isSuccess()) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

}
