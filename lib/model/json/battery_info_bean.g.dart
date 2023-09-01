// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatteryInfoBean _$BatteryInfoBeanFromJson(Map<String, dynamic> json) =>
    BatteryInfoBean(
      json['battery_health'] as int?,
      (json['battery_pct'] as num).toDouble(),
      json['battery_temperature'] as int?,
      json['charge_type'] as int?,
      json['is_charging'] as int?,
      (json['screen_brightness'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BatteryInfoBeanToJson(BatteryInfoBean instance) =>
    <String, dynamic>{
      'battery_health': instance.batteryHealth,
      'battery_pct': instance.batteryPct,
      'battery_temperature': instance.batteryTemperature,
      'charge_type': instance.chargeType,
      'is_charging': instance.isCharging,
      'screen_brightness': instance.screenBrightness,
    };
