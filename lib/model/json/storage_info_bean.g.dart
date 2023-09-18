// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageInfoBean _$StorageInfoBeanFromJson(Map<String, dynamic> json) =>
    StorageInfoBean(
      json['internal_storage_total'] as int?,
      json['internal_storage_usable'] as int?,
      json['memory_card_size'] as int?,
      json['memory_card_size_use'] as int?,
      json['ramTotalSize'] as int?,
      json['ramUsableSize'] as int?,
      json['memory_card_usable_size'] as int?,
      json['app_max_memory'] as int?,
      json['app_available_memory'] as int?,
      json['app_free_memory'] as int?,
    );

Map<String, dynamic> _$StorageInfoBeanToJson(StorageInfoBean instance) =>
    <String, dynamic>{
      'internal_storage_total': instance.internalStorageTotal,
      'internal_storage_usable': instance.internalStorageUsable,
      'memory_card_size': instance.memoryCardSize,
      'memory_card_size_use': instance.memoryCardSizeUse,
      'ramTotalSize': instance.ramTotalSize,
      'ramUsableSize': instance.ramUsableSize,
      'memory_card_usable_size': instance.memoryCardUsableSize,
      'app_max_memory': instance.appMaxMemory,
      'app_available_memory': instance.appAvailableMemory,
      'app_free_memory': instance.appFreeMemory,
    };
