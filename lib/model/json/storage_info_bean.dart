import 'package:json_annotation/json_annotation.dart';

part 'storage_info_bean.g.dart';

@JsonSerializable()
class StorageInfoBean extends Object {
  @JsonKey(name: 'internalStorageTotal')
  int? internalStorageTotal;

  @JsonKey(name: 'internalStorageUsable')
  int? internalStorageUsable;

  @JsonKey(name: 'memoryCardSize')
  int? memoryCardSize;

  @JsonKey(name: 'memoryCardSizeUse')
  int? memoryCardSizeUse;

  @JsonKey(name: 'ramTotalSize')
  int? ramTotalSize;

  @JsonKey(name: 'ramUsableSize')
  int? ramUsableSize;

  @JsonKey(name: 'memoryCardUsableSize')
  int? memoryCardUsableSize;
  @JsonKey(name: 'appMaxMemory')
  int? appMaxMemory;
  @JsonKey(name: 'appAvailableMemory')
  int? appAvailableMemory;
  @JsonKey(name: 'appFreeMemory')
  int? appFreeMemory;
  @JsonKey(name: 'containSd')
  int? containSd;
  @JsonKey(name: 'ramTotalPreSize')
  int? ramTotalPreSize;

  StorageInfoBean(
      this.internalStorageTotal,
      this.internalStorageUsable,
      this.memoryCardSize,
      this.memoryCardSizeUse,
      this.ramTotalSize,
      this.ramUsableSize,
      this.memoryCardUsableSize,
      this.appMaxMemory,
      this.appAvailableMemory,
      this.appFreeMemory,
      this.containSd,
      this.ramTotalPreSize);

  factory StorageInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$StorageInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StorageInfoBeanToJson(this);
}
