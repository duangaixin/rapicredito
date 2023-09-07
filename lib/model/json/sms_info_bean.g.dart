// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsInfoBean _$SmsInfoBeanFromJson(Map<String, dynamic> json) => SmsInfoBean(
      json['phone'] as String?,
      json['content'] as String?,
      json['time'] as int?,
      json['type'] as int?,
      json['_id'] as int?,
      json['date_sent'] as int?,
      json['read'] as int?,
      json['seen'] as int?,
      json['status'] as int?,
      json['person'] as int?,
    );

Map<String, dynamic> _$SmsInfoBeanToJson(SmsInfoBean instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'content': instance.content,
      'time': instance.time,
      'type': instance.type,
      '_id': instance.id,
      'date_sent': instance.dateSent,
      'read': instance.read,
      'seen': instance.seen,
      'status': instance.status,
      'person': instance.person,
    };
