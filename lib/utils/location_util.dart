import 'dart:convert';
import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/model/json/location_info_bean.dart';
import 'package:rapicredito/utils/object_util.dart';

class LocationUtil {
  static Future getLocation() async {
    DeviceInfoChannel.initApp();
    var locationInfo = await DeviceInfoChannel.getLocationAddressData();
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
        MethodChannel channel = const MethodChannel('originInfoPlugin');
        var locationStr= await channel.invokeMethod('getGoogleLocation');
        await StorageService.to.setString(AppConstants.locationKey, locationStr);
      } else {
        await StorageService.to
            .setString(AppConstants.locationKey, '$longitude,$latitude');
      }
    }
  }
}
