import 'package:json_annotation/json_annotation.dart';

part 'storage_info_bean.g.dart';

@JsonSerializable()
class StorageInfoBean extends Object {
  @JsonKey(name: 'internal_storage_total')
  int? internalStorageTotal;

  @JsonKey(name: 'internal_storage_usable')
  int? internalStorageUsable;

  @JsonKey(name: 'memory_card_size')
  int? memoryCardSize;

  @JsonKey(name: 'memory_card_size_use')
  int? memoryCardSizeUse;

  @JsonKey(name: 'ramTotalSize')
  int? ramTotalSize;

  @JsonKey(name: 'ramUsableSize')
  int? ramUsableSize;

  @JsonKey(name: 'memory_card_usable_size')
  int? memoryCardUsableSize;
  @JsonKey(name: 'app_max_memory')
  int? appMaxMemory;
  @JsonKey(name: 'app_available_memory')
  int? appAvailableMemory;
  @JsonKey(name: 'app_free_memory')
  int? appFreeMemory;

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
      this.appFreeMemory);

  factory StorageInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$StorageInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StorageInfoBeanToJson(this);
}
