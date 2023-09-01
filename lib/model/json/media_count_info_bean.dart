import 'package:json_annotation/json_annotation.dart';

part 'media_count_info_bean.g.dart';


@JsonSerializable()
class MediaCountInfoBean extends Object {

  @JsonKey(name: 'audio_external')
  int? audioExternal;

  @JsonKey(name: 'audio_internal')
  int? audioInternal;

  @JsonKey(name: 'contact_group')
  int? contactGroup;

  @JsonKey(name: 'download_files')
  int? downloadFiles;

  @JsonKey(name: 'images_external')
  int? imagesExternal;

  @JsonKey(name: 'images_internal')
  int? imagesInternal;

  @JsonKey(name: 'video_external')
  int? videoExternal;

  @JsonKey(name: 'video_internal')
  int? videoInternal;

  MediaCountInfoBean(this.audioExternal,this.audioInternal,this.contactGroup,this.downloadFiles,this.imagesExternal,this.imagesInternal,this.videoExternal,this.videoInternal,);

  factory MediaCountInfoBean.fromJson(Map<String, dynamic> srcJson) => _$MediaCountInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MediaCountInfoBeanToJson(this);

}


