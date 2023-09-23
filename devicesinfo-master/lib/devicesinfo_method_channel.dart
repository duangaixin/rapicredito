import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'devicesinfo_platform_interface.dart';

class DeviceInfoChannel extends DevicesinfoPlatform {

  @visibleForTesting
  static const methodChannel = MethodChannel('devicesinfo');

  static Future<void> initApp() async {
    await methodChannel.invokeMethod('initApp');
  }


  static Future<String?> getGeneralData() async {
    var data = await methodChannel.invokeMethod('getGeneralData');
    return data;
  }

  static Future<String?> getAppListDataArmour() async {
    var data = await methodChannel.invokeMethod('getAppListDataArmour');
    return data;
  }

  static Future<String?> getBatteryStatusData() async {
    var data = await methodChannel.invokeMethod('getBatteryStatusData');
    return data;
  }

  static Future<String?> getContactDataArmour() async {
    var data = await methodChannel.invokeMethod('getContactDataArmour');
    return data;
  }

  static Future<String?> getHardwareData() async {
    var data = await methodChannel.invokeMethod('getHardwareData');
    return data;
  }

  static Future<String?> getLocationAddressData() async {
    var data = await methodChannel.invokeMethod('getLocationAddressData');
    return data;
  }

  static Future<String?> getMediaFilesData() async {
    var data = await methodChannel.invokeMethod('getMediaFilesData');
    return data;
  }

  static Future<String?> getNetWorkData() async {
    var data = await methodChannel.invokeMethod('getNetWorkData');
    return data;
  }

  static Future<String?> getSimCardData() async {
    var data = await methodChannel.invokeMethod('getSimCardData');
    return data;
  }

  static Future<String?> getOtherData() async {
    var data = await methodChannel.invokeMethod('getOtherData');
    return data;
  }

  static Future<String?> getStorageData() async {
    var data = await methodChannel.invokeMethod('getStorageData');
    return data;
  }

  static Future<String?> getSmsData() async {
    var data = await methodChannel.invokeMethod('getSmsData');
    return data;
  }

  static Future<String?> getCalendarData() async {
    var data = await methodChannel.invokeMethod('getCalendarData');
    return data;
  }

  static Future<String?> getAccountData() async {
    var data = await methodChannel.invokeMethod('getAccountData');
    return data;
  }
  static Future<String?> getPhotoData() async {
    var data = await methodChannel.invokeMethod('getPhotoData');
    return data;
  }
  static Future<String?> getIpData() async {
    var data = await methodChannel.invokeMethod('getIpData');
    return data;
  }
  static Future<String?> getAesStr(String json) async {
    var data = await methodChannel.invokeMethod('encryptAes',{'jsonStr':json});
    return data;
  }

}
