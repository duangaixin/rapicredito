import 'dart:convert';

import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:rapicredito/model/json/app_list_info_bean.dart';
import 'package:rapicredito/model/json/battery_info_bean.dart';
import 'package:rapicredito/model/json/general_info_bean.dart';
import 'package:rapicredito/model/json/hardware_info_bean.dart';
import 'package:rapicredito/utils/object_util.dart';

class UploadJsonManage {
  static final UploadJsonManage instance = UploadJsonManage._internal();

  factory UploadJsonManage() {
    return instance;
  }

  UploadJsonManage._internal() {
    init();
  }

  void init() {
    MethodChannelDevicesinfo.initApp();
  }

  ///app 一般手机信息
  Future<void> getGeneralData() async {
    var generalData = await MethodChannelDevicesinfo.getGeneralData();
    if (!ObjectUtil.isEmptyString(generalData)) {
      var map = json.decode(generalData!);
      var bean = GeneralInfoBean.fromJson(map);
      print(bean);
    }
  }

  ///app list
  Future<void> getAppListDataInfo() async {
    var appListDataInfo = await MethodChannelDevicesinfo.getAppListDataArmour();
    if (!ObjectUtil.isEmptyString(appListDataInfo)) {
      List appList = json.decode(appListDataInfo!);
      print(appList.length.toString() + 'dxx');
    }
  }

  ///电池信息
  Future<void> getBatteryStatusInfo() async {
    var batteryInfo = await MethodChannelDevicesinfo.getBatteryStatusData();
    if (!ObjectUtil.isEmptyString(batteryInfo)) {
      var map = json.decode(batteryInfo!);
      var bean = BatteryInfoBean.fromJson(map);
      print(bean);
    }
  }

  ///硬件信息
  Future<void> getHardwareInfo() async {
    var hardWareInfo = await MethodChannelDevicesinfo.getHardwareData();
    if (!ObjectUtil.isEmptyString(hardWareInfo)) {
      var map = json.decode(hardWareInfo!);
      var bean = HardwareInfoBean.fromJson(map);
      print(bean);
    }
  }


}
