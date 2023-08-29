// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientInfoBean _$ClientInfoBeanFromJson(Map<String, dynamic> json) =>
    ClientInfoBean(
      (json['busyChimneyLiquidStadiumRectangleArithmetic'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ClientInfoItemBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['firmHeadteacherThoseMadamSecret'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ClientInfoItemBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stillEmbassyVillagerReviewer'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ClientInfoItemBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['aggressiveExamUsedBackStove'] as String?,
    );

Map<String, dynamic> _$ClientInfoBeanToJson(ClientInfoBean instance) =>
    <String, dynamic>{
      'busyChimneyLiquidStadiumRectangleArithmetic':
          instance.busyChimneyLiquidStadiumRectangleArithmetic,
      'firmHeadteacherThoseMadamSecret':
          instance.firmHeadteacherThoseMadamSecret,
      'stillEmbassyVillagerReviewer': instance.stillEmbassyVillagerReviewer,
      'aggressiveExamUsedBackStove': instance.aggressiveExamUsedBackStove,
    };

ClientInfoItemBean _$ClientInfoItemBeanFromJson(Map<String, dynamic> json) =>
    ClientInfoItemBean(
      json['everydayMapleChallengingAirline'] as String?,
      json['latestCandle'] as String?,
    );

Map<String, dynamic> _$ClientInfoItemBeanToJson(ClientInfoItemBean instance) =>
    <String, dynamic>{
      'everydayMapleChallengingAirline':
          instance.everydayMapleChallengingAirline,
      'latestCandle': instance.latestCandle,
    };
