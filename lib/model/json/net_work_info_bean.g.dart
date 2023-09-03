// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_work_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetWorkInfoBean _$NetWorkInfoBeanFromJson(Map<String, dynamic> json) =>
    NetWorkInfoBean(
      json['ip'] as String?,
      (json['configured_wifi'] as List<dynamic>?)
          ?.map((e) => CurrentWifi.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['current_wifi'] == null
          ? null
          : CurrentWifi.fromJson(json['current_wifi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetWorkInfoBeanToJson(NetWorkInfoBean instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'configured_wifi': instance.configuredWifi,
      'current_wifi': instance.currentWifi,
    };

CurrentWifi _$CurrentWifiFromJson(Map<String, dynamic> json) => CurrentWifi(
      json['bssid'] as String?,
      json['ssid'] as String?,
      json['name'] as String?,
      json['mac'] as String?,
    );

Map<String, dynamic> _$CurrentWifiToJson(CurrentWifi instance) =>
    <String, dynamic>{
      'bssid': instance.bssid,
      'ssid': instance.ssid,
      'name': instance.name,
      'mac': instance.mac,
    };
