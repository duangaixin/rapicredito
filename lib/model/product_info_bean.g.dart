// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInfoBean _$ProductInfoBeanFromJson(Map<String, dynamic> json) =>
    ProductInfoBean(
      (json['skillfulFingerFarSide'] as List<dynamic>?)
          ?.map(
              (e) => SkillfulFingerFarSide.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['brightGarbageAidsGallon'] as int?,
      json['changeableBloodFridge'] as String?,
    );

Map<String, dynamic> _$ProductInfoBeanToJson(ProductInfoBean instance) =>
    <String, dynamic>{
      'skillfulFingerFarSide': instance.skillfulFingerFarSide,
      'brightGarbageAidsGallon': instance.brightGarbageAidsGallon,
      'changeableBloodFridge': instance.changeableBloodFridge,
    };

SkillfulFingerFarSide _$SkillfulFingerFarSideFromJson(
        Map<String, dynamic> json) =>
    SkillfulFingerFarSide(
      (json['spokenMaleSailor'] as num?)?.toDouble(),
      (json['greedyEraserSpiritualLeaf'] as num?)?.toDouble(),
      json['cleverFightSatisfactionCustom'] as int?,
      (json['disabledAirmailCabRoundaboutFingernail'] as num?)?.toDouble(),
      (json['cleverMaidActualFoot'] as num?)?.toDouble(),
      json['strictMedicalPuzzleCafeteria'] as int?,
    );

Map<String, dynamic> _$SkillfulFingerFarSideToJson(
        SkillfulFingerFarSide instance) =>
    <String, dynamic>{
      'spokenMaleSailor': instance.spokenMaleSailor,
      'greedyEraserSpiritualLeaf': instance.greedyEraserSpiritualLeaf,
      'cleverFightSatisfactionCustom': instance.cleverFightSatisfactionCustom,
      'disabledAirmailCabRoundaboutFingernail':
          instance.disabledAirmailCabRoundaboutFingernail,
      'cleverMaidActualFoot': instance.cleverMaidActualFoot,
      'strictMedicalPuzzleCafeteria': instance.strictMedicalPuzzleCafeteria,
    };
