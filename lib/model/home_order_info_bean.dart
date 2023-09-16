import 'package:json_annotation/json_annotation.dart';

part 'home_order_info_bean.g.dart';

@JsonSerializable()
class HomeOrderInfoBean extends Object {
  @JsonKey(name: 'unusualPing')
  double? unusualPing;
  @JsonKey(name: 'prettyRefrigeratorSleepyPaleNovelist')
  String? prettyRefrigeratorSleepyPaleNovelist;
  @JsonKey(name: 'valuableCurrencyBackSkiPineapple')
  String? valuableCurrencyBackSkiPineapple;
  @JsonKey(name: 'aggressiveExamUsedBackStove')
  String? aggressiveExamUsedBackStove;
  @JsonKey(name: 'quietGreekFairDebt')
  String? quietGreekFairDebt;
  @JsonKey(name: 'unsafeLicenseNut')
  double? unsafeLicenseNut;
  @JsonKey(name: 'richChangeableMuchFebruary')
  String? richChangeableMuchFebruary;
  @JsonKey(name: 'busyBellyShower')
  String? busyBellyShower;
  @JsonKey(name: 'dayLateFee')
  double? dayLateFee;

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
  String? endlessPie;
  @JsonKey(name: 'cottonScreamMusicalAnybody')

  ///repayTypeFlag
  String? cottonScreamMusicalAnybody;

  @JsonKey(name: 'freeCleanerBluePineapple')
  double? freeCleanerBluePineapple;
  @JsonKey(name: 'mexicanMedicalCan')
  int? mexicanMedicalCan;

  HomeOrderInfoBean(
      this.unusualPing,
      this.prettyRefrigeratorSleepyPaleNovelist,
      this.valuableCurrencyBackSkiPineapple,
      this.aggressiveExamUsedBackStove,
      this.quietGreekFairDebt,
      this.unsafeLicenseNut,
      this.richChangeableMuchFebruary,
      this.busyBellyShower,
      this.dayLateFee,
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
      this.cottonScreamMusicalAnybody,
      this.freeCleanerBluePineapple,
      this.mexicanMedicalCan
      );

  factory HomeOrderInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeOrderInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeOrderInfoBeanToJson(this);
}
