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

  @JsonKey(name: 'ram_total_size')
  int? ramTotalSize;

  @JsonKey(name: 'ram_usable_size')
  int? ramUsableSize;

  StorageInfoBean(this.internalStorageTotal,this.internalStorageUsable,this.memoryCardSize,this.memoryCardSizeUse,this.ramTotalSize,this.ramUsableSize,);

  factory StorageInfoBean.fromJson(Map<String, dynamic> srcJson) => _$StorageInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StorageInfoBeanToJson(this);

}


