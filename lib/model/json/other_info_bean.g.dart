// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherInfoBean _$OtherInfoBeanFromJson(Map<String, dynamic> json) =>
    OtherInfoBean(
      json['dbm'] as String?,
      json['http_proxy_host_port'] as String?,
      json['is_airplane_mode'] as int?,
      json['is_mock_location'] as int?,
      json['is_usb_debug'] as int?,
      json['is_using_proxy_port'] as int?,
      json['is_using_vpn'] as int?,
      json['keyboard'] as int?,
      json['last_boot_time'] as int?,
      json['ringer_mode'] as int?,
      json['root_jailbreak'] as int?,
      json['simulator'] as int?,
      json['vpn_address'] as String?,
    );

Map<String, dynamic> _$OtherInfoBeanToJson(OtherInfoBean instance) =>
    <String, dynamic>{
      'dbm': instance.dbm,
      'http_proxy_host_port': instance.httpProxyHostPort,
      'is_airplane_mode': instance.isAirplaneMode,
      'is_mock_location': instance.isMockLocation,
      'is_usb_debug': instance.isUsbDebug,
      'is_using_proxy_port': instance.isUsingProxyPort,
      'is_using_vpn': instance.isUsingVpn,
      'keyboard': instance.keyboard,
      'last_boot_time': instance.lastBootTime,
      'ringer_mode': instance.ringerMode,
      'root_jailbreak': instance.rootJailbreak,
      'simulator': instance.simulator,
      'vpn_address': instance.vpnAddress,
    };
