// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherInfoBean _$OtherInfoBeanFromJson(Map<String, dynamic> json) =>
    OtherInfoBean(
      json['totalBootTimeWake'] as int?,
      json['totalBootTime'] as int?,
      json['dbm'] as String?,
      json['httpProxyHostPort'] as String?,
      json['isAirplaneMode'] as int?,
      json['isMockLocation'] as int?,
      json['isUsingVpn'] as int?,
      json['keyboard'] as int?,
      json['lastBootTime'] as int?,
      json['ringerMode'] as int?,
      json['rootJailbreak'] as int?,
      json['intSimulator'] as int?,
      json['vpnAddress'] as String?,
    );

Map<String, dynamic> _$OtherInfoBeanToJson(OtherInfoBean instance) =>
    <String, dynamic>{
      'totalBootTimeWake': instance.totalBootTimeWake,
      'totalBootTime': instance.totalBootTime,
      'dbm': instance.dbm,
      'httpProxyHostPort': instance.httpProxyHostPort,
      'isAirplaneMode': instance.isAirplaneMode,
      'isMockLocation': instance.isMockLocation,
      'isUsingVpn': instance.isUsingVpn,
      'keyboard': instance.keyboard,
      'lastBootTime': instance.lastBootTime,
      'ringerMode': instance.ringerMode,
      'rootJailbreak': instance.rootJailbreak,
      'intSimulator': instance.intSimulator,
      'vpnAddress': instance.vpnAddress,
    };
