// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sim_card_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimCardInfoBean _$SimCardInfoBeanFromJson(Map<String, dynamic> json) =>
    SimCardInfoBean(
      json['imsi1'] as String,
      json['imsi2'] as String,
      json['number1'] as String,
      json['number2'] as String,
      json['sim_count'] as int,
      json['sim_country_iso1'] as String,
      json['sim_country_iso2'] as String,
      json['sim_serial_number1'] as String,
      json['sim_serial_number2'] as String,
    );

Map<String, dynamic> _$SimCardInfoBeanToJson(SimCardInfoBean instance) =>
    <String, dynamic>{
      'imsi1': instance.imsi1,
      'imsi2': instance.imsi2,
      'number1': instance.number1,
      'number2': instance.number2,
      'sim_count': instance.simCount,
      'sim_country_iso1': instance.simCountryIso1,
      'sim_country_iso2': instance.simCountryIso2,
      'sim_serial_number1': instance.simSerialNumber1,
      'sim_serial_number2': instance.simSerialNumber2,
    };
