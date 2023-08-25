import 'package:device_identity/device_identity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_api.dart';
import 'package:rapicredito/http/log_interceptor.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/net/base_response.dart';
import 'package:rapicredito/net/net_config.dart';
import 'package:rapicredito/net/net_request.dart';
import 'package:rapicredito/utils/object_util.dart';

late NetRequest httpRequest;

Future<void> initHttp() async {
  httpRequest = NetRequest.init(netConfig);
}

var netConfig = NetConfig(
  baseUrl: HttpApi.apiBaseUrl,
  isLoggable: () => true,
  defHeader: _getDefHeader,
  defParam: _getDefParam,
  onCheck401Error: _check401Error,
  defInterceptors: getNetInterceptors(),
);

bool isReleaseBuild() => !kProfileMode && kReleaseMode;

void _check401Error(BaseResponse<dynamic> error) async {
  if (is401Error(error)) {}
}

bool is401Error(BaseResponse<dynamic> error) {
  // if (error.code != null) {
  //   return true;
  // }
  return error.errorDio is DioException &&
      error.errorDio.response?.statusCode == 401;
}

Future<Map<String, dynamic>> _getDefHeader() async {
  var map = <String, dynamic>{};
  var userId = StorageService.to.getString(AppConstants.userIdKey);
  var token = StorageService.to.getString(AppConstants.userTokenKey);
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  var versionName = packageInfo.version;
  var buildNumber = packageInfo.buildNumber;
  var deviceId = await PlatformDeviceId.getDeviceId ?? '';
  var imei = await DeviceIdentity.imei;
  if (ObjectUtil.isEmptyString(imei)) {
    imei = deviceId;
  }
  if (ObjectUtil.isEmptyString(imei)) {
    final deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    var serialNumber = androidInfo.serialNumber;
    imei = serialNumber;
  }
  map['delightedHospitalGoldenMuttonManyTaxi'] = '204';
  map['darkPlentyNervousHandbag'] = token;
  map['terminalDifferentActionFatFountain'] = userId;
  map['taxFebruary'] = 'googleplay';
  map['extraordinaryIndependentCollegeDeal'] = versionName;
  map['literaryMineralFatHillSwiftRobot'] = buildNumber;
  map['italianArm'] = imei;
  map['emptyChainFamousJewel'] = imei;
  map['electronicRiceEarth'] = imei;
  map['perfectAche'] = true;
  return map;
}

Future<Map<String, dynamic>> _getDefParam() async {
  var map = <String, dynamic>{};
  var userId = StorageService.to.getString(AppConstants.userIdKey);
  map['madUnableBackacheCanal'] = '204';
  map['terminalDifferentActionFatFountain'] = userId;
  map['dailyFortuneQuantity'] = '0.0,0.0';
  map['contraryScientificRightNone'] = 'es';

  return map;
}

Interceptors? getNetInterceptors() {
  if (!isReleaseBuild()) {
    return Interceptors()..add(LoggingInterceptor());
  }
  return null;
}
