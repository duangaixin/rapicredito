// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageInfoBean _$StorageInfoBeanFromJson(Map<String, dynamic> json) =>
    StorageInfoBean(
      json['internalStorageTotal'] as int?,
      json['internalStorageUsable'] as int?,
      json['memoryCardSize'] as int?,
      json['memoryCardSizeUse'] as int?,
      json['ramTotalSize'] as int?,
      json['ramUsableSize'] as int?,
      json['memoryCardUsableSize'] as int?,
      json['appMaxMemory'] as int?,
      json['appAvailableMemory'] as int?,
      json['appFreeMemory'] as int?,
      json['containSd'] as int?,
      json['ramTotalPreSize'] as int?,
    );

Map<String, dynamic> _$StorageInfoBeanToJson(StorageInfoBean instance) =>
    <String, dynamic>{
      'internalStorageTotal': instance.internalStorageTotal,
      'internalStorageUsable': instance.internalStorageUsable,
      'memoryCardSize': instance.memoryCardSize,
      'memoryCardSizeUse': instance.memoryCardSizeUse,
      'ramTotalSize': instance.ramTotalSize,
      'ramUsableSize': instance.ramUsableSize,
      'memoryCardUsableSize': instance.memoryCardUsableSize,
      'appMaxMemory': instance.appMaxMemory,
      'appAvailableMemory': instance.appAvailableMemory,
      'appFreeMemory': instance.appFreeMemory,
      'containSd': instance.containSd,
      'ramTotalPreSize': instance.ramTotalPreSize,
    };
