import 'package:json_annotation/json_annotation.dart';

part 'product_info_bean.g.dart';


@JsonSerializable()
class ProductInfoBean extends Object {

  @JsonKey(name: 'skillfulFingerFarSide')
  List<SkillfulFingerFarSide>? skillfulFingerFarSide;

  @JsonKey(name: 'brightGarbageAidsGallon')
  int? brightGarbageAidsGallon;

  @JsonKey(name: 'changeableBloodFridge')
  String? changeableBloodFridge;

  ProductInfoBean(this.skillfulFingerFarSide,this.brightGarbageAidsGallon,this.changeableBloodFridge,);

  factory ProductInfoBean.fromJson(Map<String, dynamic> srcJson) => _$ProductInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductInfoBeanToJson(this);

}


@JsonSerializable()
class SkillfulFingerFarSide extends Object {

  @JsonKey(name: 'spokenMaleSailor')
  double? spokenMaleSailor;

  @JsonKey(name: 'greedyEraserSpiritualLeaf')
  double? greedyEraserSpiritualLeaf;

  @JsonKey(name: 'cleverFightSatisfactionCustom')
  int? cleverFightSatisfactionCustom;

  @JsonKey(name: 'disabledAirmailCabRoundaboutFingernail')
  double? disabledAirmailCabRoundaboutFingernail;

  @JsonKey(name: 'cleverMaidActualFoot')
  double? cleverMaidActualFoot;

  @JsonKey(name: 'strictMedicalPuzzleCafeteria')
  int? strictMedicalPuzzleCafeteria;

  SkillfulFingerFarSide(this.spokenMaleSailor,this.greedyEraserSpiritualLeaf,this.cleverFightSatisfactionCustom,this.disabledAirmailCabRoundaboutFingernail,this.cleverMaidActualFoot,this.strictMedicalPuzzleCafeteria,);

  factory SkillfulFingerFarSide.fromJson(Map<String, dynamic> srcJson) => _$SkillfulFingerFarSideFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SkillfulFingerFarSideToJson(this);

}


