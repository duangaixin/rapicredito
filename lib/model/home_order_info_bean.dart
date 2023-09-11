import 'package:json_annotation/json_annotation.dart';

part 'home_order_info_bean.g.dart';

@JsonSerializable()
class HomeOrderInfoBean extends Object {
  @JsonKey(name: 'spiritualPlanetEggplantRelation')
  String? spiritualPlanetEggplantRelation;

  @JsonKey(name: 'federalDirectorySituation')
  int? federalDirectorySituation;

  @JsonKey(name: 'disabledLondonPrivatePoolAmericanInstrument')
  int? disabledLondonPrivatePoolAmericanInstrument;

  @JsonKey(name: 'eachGeometryLameCafe')
  String? eachGeometryLameCafe;

  @JsonKey(name: 'powerfulBalconyForgetfulFlash')
  String? powerfulBalconyForgetfulFlash;

  @JsonKey(name: 'valuableRussianForestCop')
  String? valuableRussianForestCop;

  @JsonKey(name: 'violentPartRudeGreeting')
  String? violentPartRudeGreeting;

  @JsonKey(name: 'extraordinaryRussianThoroughText')
  String? extraordinaryRussianThoroughText;

  @JsonKey(name: 'freshBookcaseModestPing')
  double? freshBookcaseModestPing;

  @JsonKey(name: 'centralTechnologyAboveCarefulTomato')
  int? centralTechnologyAboveCarefulTomato;

  @JsonKey(name: 'modestExpensiveBrunch')
  String? modestExpensiveBrunch;

  @JsonKey(name: 'sharpStrictRelationship')
  double? sharpStrictRelationship;

  @JsonKey(name: 'halfClassicalPlayerLot')
  String? halfClassicalPlayerLot;

  @JsonKey(name: 'interestingComradeHairIntroduction')
  double? interestingComradeHairIntroduction;

  @JsonKey(name: 'looseBunFacialSaladNeatAlarm')
  String? looseBunFacialSaladNeatAlarm;

  @JsonKey(name: 'triangleRemarkIllBattery')
  double? triangleRemarkIllBattery;

  @JsonKey(name: 'frequentSuddenMosquitoNonCourse')
  int? frequentSuddenMosquitoNonCourse;

  @JsonKey(name: 'civilCompanyDirectionFondPercentage')
  String? civilCompanyDirectionFondPercentage;

  @JsonKey(name: 'valuableRabbitFarm')
  String? valuableRabbitFarm;

  @JsonKey(name: 'nextCounterConvenienceHandkerchief')
  String? nextCounterConvenienceHandkerchief;

  @JsonKey(name: 'strictMedicalPuzzleCafeteria')

  ///duration
  int? strictMedicalPuzzleCafeteria;

  @JsonKey(name: 'paleSuiteUnderwearHot')
  String? paleSuiteUnderwearHot;
  @JsonKey(name: 'indeedSoftMomEnoughPill')
  String? indeedSoftMomEnoughPill;
  @JsonKey(name: 'endlessPie')
  int? endlessPie;
  @JsonKey(name: 'cottonScreamMusicalAnybody')

  ///repayTypeFlag
  String? cottonScreamMusicalAnybody;

  HomeOrderInfoBean(
      this.spiritualPlanetEggplantRelation,
      this.federalDirectorySituation,
      this.disabledLondonPrivatePoolAmericanInstrument,
      this.eachGeometryLameCafe,
      this.powerfulBalconyForgetfulFlash,
      this.valuableRussianForestCop,
      this.violentPartRudeGreeting,
      this.extraordinaryRussianThoroughText,
      this.freshBookcaseModestPing,
      this.centralTechnologyAboveCarefulTomato,
      this.modestExpensiveBrunch,
      this.sharpStrictRelationship,
      this.halfClassicalPlayerLot,
      this.interestingComradeHairIntroduction,
      this.looseBunFacialSaladNeatAlarm,
      this.triangleRemarkIllBattery,
      this.frequentSuddenMosquitoNonCourse,
      this.civilCompanyDirectionFondPercentage,
      this.valuableRabbitFarm,
      this.nextCounterConvenienceHandkerchief,
      this.strictMedicalPuzzleCafeteria,
      this.paleSuiteUnderwearHot,
      this.indeedSoftMomEnoughPill,
      this.endlessPie,
      this.cottonScreamMusicalAnybody);

  factory HomeOrderInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeOrderInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeOrderInfoBeanToJson(this);
}
