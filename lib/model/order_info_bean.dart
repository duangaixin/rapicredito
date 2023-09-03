import 'package:json_annotation/json_annotation.dart';

part 'order_info_bean.g.dart';


@JsonSerializable()
class OrderInfoBean extends Object {

  @JsonKey(name: 'disabledLondonPrivatePoolAmericanInstrument')
  String? disabledLondonPrivatePoolAmericanInstrument;

  @JsonKey(name: 'smokeCampSpanishLift')
  String? smokeCampSpanishLift;

  @JsonKey(name: 'shortHelmetModernLatterGiftedDifference')
  String? shortHelmetModernLatterGiftedDifference;

  @JsonKey(name: 'unfitImpressionSingleHandSuchElectricity')
  String? unfitImpressionSingleHandSuchElectricity;

  @JsonKey(name: 'bornDoubleShallowAcheActiveSparrow')
  String? bornDoubleShallowAcheActiveSparrow;

  @JsonKey(name: 'skillfulExpressionSaltyYard')
  String? skillfulExpressionSaltyYard;

  @JsonKey(name: 'aggressiveExamUsedBackStove')
  String? aggressiveExamUsedBackStove;

  @JsonKey(name: 'funnyAustraliaTeamTale')
  String? funnyAustraliaTeamTale;

  @JsonKey(name: 'luckyExperience')
  String? luckyExperience;

  @JsonKey(name: 'interestingComradeHairIntroduction')
  String? interestingComradeHairIntroduction;

  @JsonKey(name: 'disabledBusyEngine')
  String? disabledBusyEngine;

  @JsonKey(name: 'mexicanMedicalCan')
  String? mexicanMedicalCan;

  @JsonKey(name: 'passiveHis')
  String? passiveHis;

  @JsonKey(name: 'endlessPie')
  String? endlessPie;

  @JsonKey(name: 'civilCompanyDirectionFondPercentage')
  String? civilCompanyDirectionFondPercentage;

  @JsonKey(name: 'formerClassicalUnitForgetfulStarvation')
  String? formerClassicalUnitForgetfulStarvation;

  @JsonKey(name: 'bestJuly')
  String? bestJuly;

  OrderInfoBean(this.disabledLondonPrivatePoolAmericanInstrument,this.smokeCampSpanishLift,this.shortHelmetModernLatterGiftedDifference,this.unfitImpressionSingleHandSuchElectricity,this.bornDoubleShallowAcheActiveSparrow,this.skillfulExpressionSaltyYard,this.aggressiveExamUsedBackStove,this.funnyAustraliaTeamTale,this.luckyExperience,this.interestingComradeHairIntroduction,this.disabledBusyEngine,this.mexicanMedicalCan,this.passiveHis,this.endlessPie,this.civilCompanyDirectionFondPercentage,this.formerClassicalUnitForgetfulStarvation,this.bestJuly,);

  factory OrderInfoBean.fromJson(Map<String, dynamic> srcJson) => _$OrderInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderInfoBeanToJson(this);

}

