import 'dart:convert';
import 'package:device_identity/device_identity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/json/upload_json_manage.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/object_util.dart';

class AppMainCtr extends BaseGetCtr {
  AppMainCtr();

  late final PageController pageController;

  late final List<BottomNavigationBarItem> bottomTabList;

  final state = AppMainState();

  void dealNavBarTap(int index) {
    if (UserStore.to.hasToken || index == 0) {
      pageController.jumpToPage(index);
    } else {
      if (index != 0) {
        Get.toNamed(PageRouterName.loginPage);
      }
    }
  }

  void dealPageChanged(int index) {
    state.pageIndex = index;
    if (state.pageIndex == 0) {
      var homeCtr = Get.find<MainHomeCtr>();
      homeCtr.requestInitData();
    } else if (state.pageIndex == 1) {
      if (UserStore.to.hasToken) {
        var orderCtr = Get.find<MainOrderCtr>();
        orderCtr.requestInitData();
      }
    } else if (state.pageIndex == 2) {
      if (UserStore.to.hasToken) {
        var mineCtr = Get.find<MainMineCtr>();
        var phoneNum = UserStore.to.mUserPhone;
        if (!ObjectUtil.isEmptyString(phoneNum)) {
          mineCtr.state.phoneNum = phoneNum;
        }
        mineCtr.refreshInfo();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.pageIndex);
    bottomTabList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Image.asset(Resource.assetsImageMainOne, width: 25.0),
          activeIcon: Image.asset(
            Resource.assetsImageMainOneSelected,
            width: 25.0,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Image.asset(Resource.assetsImageMainTwo, width: 25.0),
          activeIcon: Image.asset(
            Resource.assetsImageMainTwoSelected,
            width: 25.0,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Image.asset(Resource.assetsImageMainThree, width: 25.0),
          activeIcon: Image.asset(
            Resource.assetsImageMainThreeSelected,
            width: 25.0,
          ),
          label: ''),
    ];
  }

  Future<String> postQueryIsNeedUploadJsonRequest() async {
    Get.showLoading();
    Map<String, dynamic> param = getCommonParam();
    var response =
        await HttpRequestManage.instance.postIsNeedUploadBigJson(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var status = response.data ?? '';
      return status;
    } else {
      NetException.dealAllException(response);
      return Future.value('');
    }
  }

  Future<bool> postUploadJsonRequest() async {
    var bean = await UploadJsonManage.instance.collectAllData();
    var jsonStr = json.encode(bean);
    // if (!ObjectUtil.isEmptyString(jsonStr)) {
    //   var response =
    //       await HttpRequestManage.instance.postUploadBigJson(jsonStr);
    //   if (response.isSuccess()) {
    //     return Future.value(true);
    //   } else {
    //     NetException.dealAllException(response);
    //     return Future.value(false);
    //   }
    // }
    var aesStr = await DeviceInfoChannel.getAesStr(jsonStr);
    if (!ObjectUtil.isEmptyString(aesStr)) {
      var response = await HttpRequestManage.instance.postUploadBigJson(aesStr);
      if (response.isSuccess()) {
        return Future.value(true);
      } else {
        NetException.dealAllException(response);
        return Future.value(false);
      }
    }
    return Future.value(false);
  }

  Future<bool> postAddPointRequest(
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
    var gid = StorageService.to.getString(AppConstants.gidKey);
    var uuid = StorageService.to.getString(AppConstants.uuidKey);

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
      ..['humorousSettlementMistakenBalcony'] = uuid
      ..['healthyBoatingCoursebookFiercePermission'] = osVersion
      ..['honestPracticeDeerRecentStone'] = userAgent
      ..['thatQuizInstitutionLeftTraining'] = 'es';

    var response = await HttpRequestManage.instance.postAddPointRequest(param);
    if (response.isSuccess()) {
      return Future.value(true);
    } else {
      NetException.dealAllException(response);
      return Future.value(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initChannel();
  }

  void _initChannel() async {
    await DeviceInfoChannel.initApp();
    // var channel = const MethodChannel('addPoint');
    // channel.setMethodCallHandler((call) {
    //   switch (call.method) {
    //     case 'installApp':
    //       {
    //         String msg = call.arguments[''];
    //       }
    //       break;
    //     case 'closeApp':
    //
    //       break;
    //     default:
    //       break;
    //   }
    //   return Future.value('');
    // });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
