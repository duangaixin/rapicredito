import 'package:json_annotation/json_annotation.dart';

part 'product_info_bean.g.dart';


@JsonSerializable()
class ProductInfoBean extends Object {

  @JsonKey(name: 'skillfulFingerFarSide')
  List<SkillfulFingerFarSide>? skillfulFingerFarSide;

  @JsonKey(name: 'brightGarbageAidsGallon')
  ///productId
  int? brightGarbageAidsGallon;

  @JsonKey(name: 'changeableBloodFridge')
  ///serverTime
  String? changeableBloodFridge;

  ProductInfoBean(this.skillfulFingerFarSide,this.brightGarbageAidsGallon,this.changeableBloodFridge,);

  factory ProductInfoBean.fromJson(Map<String, dynamic> srcJson) => _$ProductInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductInfoBeanToJson(this);

}


@JsonSerializable()
class SkillfulFingerFarSide extends Object {

  @JsonKey(name: 'spokenMaleSailor')
  ///minCreditAmount
  double? spokenMaleSailor;

  @JsonKey(name: 'greedyEraserSpiritualLeaf')
  ///rate
  double? greedyEraserSpiritualLeaf;

  @JsonKey(name: 'cleverFightSatisfactionCustom')
  ///detailId
  int? cleverFightSatisfactionCustom;

  @JsonKey(name: 'disabledAirmailCabRoundaboutFingernail')
  ///incrAmount
  double? disabledAirmailCabRoundaboutFingernail;

  @JsonKey(name: 'cleverMaidActualFoot')

  ///maxCreditAmount
  double? cleverMaidActualFoot;

  @JsonKey(name: 'strictMedicalPuzzleCafeteria')

  ///duration
  int? strictMedicalPuzzleCafeteria;

  SkillfulFingerFarSide(this.spokenMaleSailor,this.greedyEraserSpiritualLeaf,this.cleverFightSatisfactionCustom,this.disabledAirmailCabRoundaboutFingernail,this.cleverMaidActualFoot,this.strictMedicalPuzzleCafeteria,);

  factory SkillfulFingerFarSide.fromJson(Map<String, dynamic> srcJson) => _$SkillfulFingerFarSideFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SkillfulFingerFarSideToJson(this);

}


