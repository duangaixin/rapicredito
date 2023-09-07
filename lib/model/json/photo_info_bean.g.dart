// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoInfoBean _$PhotoInfoBeanFromJson(Map<String, dynamic> json) =>
    PhotoInfoBean(
      json['name'] as String?,
      json['author'] as String?,
      json['height'] as String?,
      json['width'] as String?,
      json['createTime'] as String?,
      json['take_time'] as String?,
      json['save_time'] as String?,
      json['model'] as String?,
      json['orientation'] as String?,
      json['x_resolution'] as String?,
      json['y_resolution'] as String?,
      json['gps_altitude'] as String?,
      json['gps_processing_method'] as String?,
      json['lens_make'] as String?,
      json['lens_model'] as String?,
      json['focal_length'] as String?,
      json['flash'] as String?,
      json['software'] as String?,
      json['latitude'] as String?,
      json['longitude'] as String?,
    );

Map<String, dynamic> _$PhotoInfoBeanToJson(PhotoInfoBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'author': instance.author,
      'height': instance.height,
      'width': instance.width,
      'createTime': instance.createTime,
      'take_time': instance.takeTime,
      'save_time': instance.saveTime,
      'model': instance.model,
      'orientation': instance.orientation,
      'x_resolution': instance.xResolution,
      'y_resolution': instance.yResolution,
      'gps_altitude': instance.gpsAltitude,
      'gps_processing_method': instance.gpsProcessingMethod,
      'lens_make': instance.lensMake,
      'lens_model': instance.lensModel,
      'focal_length': instance.focalLength,
      'flash': instance.flash,
      'software': instance.software,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
