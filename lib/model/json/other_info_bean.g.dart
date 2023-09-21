// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherInfoBean _$OtherInfoBeanFromJson(Map<String, dynamic> json) =>
    OtherInfoBean(
      json['total_boot_time_wake'] as int?,
      json['total_boot_time'] as int?,
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
      json['sensorData'] == null
          ? null
          : SensorData.fromJson(json['sensorData'] as Map<String, dynamic>),
      json['intSimulator'] as int?,
      json['vpn_address'] as String?,
    );

Map<String, dynamic> _$OtherInfoBeanToJson(OtherInfoBean instance) =>
    <String, dynamic>{
      'total_boot_time_wake': instance.totalBootTimeWake,
      'total_boot_time': instance.totalBootTime,
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
      'sensorData': instance.sensorData,
      'intSimulator': instance.intSimulator,
      'vpn_address': instance.vpnAddress,
    };

SensorData _$SensorDataFromJson(Map<String, dynamic> json) => SensorData(
      (json['sensor_lists'] as List<dynamic>?)
          ?.map((e) => Sensor_lists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SensorDataToJson(SensorData instance) =>
    <String, dynamic>{
      'sensor_lists': instance.sensorLists,
    };

Sensor_lists _$Sensor_listsFromJson(Map<String, dynamic> json) => Sensor_lists(
      (json['max_range'] as num?)?.toDouble(),
      json['min_delay'] as int?,
      json['name'] as String?,
      (json['power'] as num?)?.toDouble(),
      (json['resolution'] as num?)?.toDouble(),
      json['type'] as int?,
      json['vendor'] as String?,
      json['version'] as int?,
    );

Map<String, dynamic> _$Sensor_listsToJson(Sensor_lists instance) =>
    <String, dynamic>{
      'max_range': instance.maxRange,
      'min_delay': instance.minDelay,
      'name': instance.name,
      'power': instance.power,
      'resolution': instance.resolution,
      'type': instance.type,
      'vendor': instance.vendor,
      'version': instance.version,
    };
