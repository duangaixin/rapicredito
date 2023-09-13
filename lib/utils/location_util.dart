import 'dart:convert';
import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/model/json/location_info_bean.dart';
import 'package:rapicredito/utils/object_util.dart';

class LocationUtil {
  static Future<Map<String, String>> getGoogleLocation() async {
    MethodChannel channel = const MethodChannel('originInfoPlugin');
    var param = await channel.invokeMethod('getGoogleLocation');
    var paramMap = <String, String>{};
    if (param != null && param is Map) {
      if (param.isNotEmpty) {
        if (param.containsKey('latitude')) {
          var latitude = param['latitude'];
          param['latitude'] = latitude;
        }
        if (param.containsKey('longitude')) {
          var longitude = param['longitude'];
          param['longitude'] = longitude;
        }
      }
    }
    return paramMap;
  }

  static Future getLocation() async {
    MethodChannelDevicesinfo.initApp();
    var locationInfo = await MethodChannelDevicesinfo.getLocationAddressData();
    if (!ObjectUtil.isEmptyString(locationInfo)) {
      var map = json.decode(locationInfo!);
      var bean = LocationInfoBean.fromJson(map);
      var latitude = bean.latitude;
      var longitude = bean.longitude;
      if (latitude == null ||
          longitude == null ||
          latitude == '0' ||
          latitude == '0.0' ||
          latitude == '0.00' ||
          longitude == '0' ||
          longitude == '0.0' ||
          longitude == '0.00') {
        var paramMap = await getGoogleLocation();
        var latitude = paramMap['latitude'];
        var longitude = paramMap['longitude'];
        await StorageService.to
            .setString(AppConstants.locationKey, '$longitude,$latitude');
      } else {
        await StorageService.to
            .setString(AppConstants.locationKey, '$longitude,$latitude');
      }
    }
  }
}
