// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_count_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaCountInfoBean _$MediaCountInfoBeanFromJson(Map<String, dynamic> json) =>
    MediaCountInfoBean(
      json['audio_external'] as int?,
      json['audio_internal'] as int?,
      json['contact_group'] as int?,
      json['download_files'] as int?,
      json['imagesInternal'] as int?,
      json['images_internal'] as int?,
      json['video_external'] as int?,
      json['video_internal'] as int?,
    );

Map<String, dynamic> _$MediaCountInfoBeanToJson(MediaCountInfoBean instance) =>
    <String, dynamic>{
      'audio_external': instance.audioExternal,
      'audio_internal': instance.audioInternal,
      'contact_group': instance.contactGroup,
      'download_files': instance.downloadFiles,
      'imagesInternal': instance.imagesExternal,
      'images_internal': instance.imagesInternal,
      'video_external': instance.videoExternal,
      'video_internal': instance.videoInternal,
    };
