// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationInfoBean _$LocationInfoBeanFromJson(Map<String, dynamic> json) =>
    LocationInfoBean(
      json['addressDetails'] as String?,
      json['city'] as String?,
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['province'] as String?,
    );

Map<String, dynamic> _$LocationInfoBeanToJson(LocationInfoBean instance) =>
    <String, dynamic>{
      'addressDetails': instance.addressDetails,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'province': instance.province,
    };
