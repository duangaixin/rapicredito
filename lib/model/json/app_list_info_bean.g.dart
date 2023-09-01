// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_list_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppListInfoBean _$AppListInfoBeanFromJson(Map<String, dynamic> json) =>
    AppListInfoBean(
      json['appName'] as String?,
      json['appType'] as int?,
      json['firstInstallTime'] as int?,
      json['flags'] as int?,
      json['lastUpdateTime'] as int?,
      json['packageName'] as String?,
      (json['specialPermissonList'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['versionCode'] as int?,
      json['versionName'] as String?,
    );

Map<String, dynamic> _$AppListInfoBeanToJson(AppListInfoBean instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'appType': instance.appType,
      'firstInstallTime': instance.firstInstallTime,
      'flags': instance.flags,
      'lastUpdateTime': instance.lastUpdateTime,
      'packageName': instance.packageName,
      'specialPermissonList': instance.specialPermissonList,
      'versionCode': instance.versionCode,
      'versionName': instance.versionName,
    };
