// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarInfoBean _$CalendarInfoBeanFromJson(Map<String, dynamic> json) =>
    CalendarInfoBean(
      json['eventTitle'] as String?,
      json['description'] as String?,
      json['location'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
    );

Map<String, dynamic> _$CalendarInfoBeanToJson(CalendarInfoBean instance) =>
    <String, dynamic>{
      'eventTitle': instance.eventTitle,
      'description': instance.description,
      'location': instance.location,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
