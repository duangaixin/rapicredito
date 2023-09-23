// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralInfoBean _$GeneralInfoBeanFromJson(Map<String, dynamic> json) =>
    GeneralInfoBean(
      json['androidId'] as String?,
      json['bluetoothMac'] as String?,
      json['cid'] as String?,
      json['dns'] as String?,
      json['gaid'] as String?,
      json['imei1'] as String?,
      json['imei2'] as String?,
      json['language'] as String?,
      json['localeDisplayLanguage'] as String?,
      json['localeIso3Country'] as String?,
      json['localeIso3Language'] as String?,
      json['mac'] as String?,
      json['mcc'] as String?,
      json['meid'] as String?,
      json['mnc'] as String?,
      json['networkOperator'] as String?,
      json['networkOperatorName'] as String?,
      json['networkType'] as String?,
      json['phoneType'] as String?,
      json['securityPatch'] as String?,
      json['slotCount'] as int?,
      json['timeZoneId'] as String?,
      json['uiModeType'] as String?,
      json['uuid'] as String?,
      json['elapsedRealtime'] as int?,
      (json['sensorList'] as List<dynamic>?)
          ?.map((e) => SensorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isUsbDebug'] as int?,
      json['isUsingProxyPort'] as int?,
    );

Map<String, dynamic> _$GeneralInfoBeanToJson(GeneralInfoBean instance) =>
    <String, dynamic>{
      'androidId': instance.andId,
      'bluetoothMac': instance.bluetoothMac,
      'cid': instance.cid,
      'dns': instance.dns,
      'gaid': instance.gaid,
      'imei1': instance.imei1,
      'imei2': instance.imei2,
      'language': instance.language,
      'localeDisplayLanguage': instance.localeDisplayLanguage,
      'localeIso3Country': instance.localeIso3Country,
      'localeIso3Language': instance.localeIso3Language,
      'mac': instance.mac,
      'mcc': instance.mcc,
      'meid': instance.meid,
      'mnc': instance.mnc,
      'networkOperator': instance.networkOperator,
      'networkOperatorName': instance.networkOperatorName,
      'networkType': instance.networkType,
      'phoneType': instance.phoneType,
      'securityPatch': instance.securityPatch,
      'slotCount': instance.slotCount,
      'timeZoneId': instance.timeZoneId,
      'uiModeType': instance.uiModeType,
      'uuid': instance.uuid,
      'elapsedRealtime': instance.elapsedRealtime,
      'sensorList': instance.sensorList,
      'isUsbDebug': instance.isUsbDebug,
      'isUsingProxyPort': instance.isUsingProxyPort,
    };

SensorData _$SensorDataFromJson(Map<String, dynamic> json) => SensorData(
      (json['max_range'] as num?)?.toDouble(),
      json['min_delay'] as int?,
      json['name'] as String?,
      (json['power'] as num?)?.toDouble(),
      (json['resolution'] as num?)?.toDouble(),
      json['type'] as int?,
      json['vendor'] as String?,
      json['version'] as int?,
    );

Map<String, dynamic> _$SensorDataToJson(SensorData instance) =>
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
