import 'package:json_annotation/json_annotation.dart';

part 'rollover_detail_info_bean.g.dart';


@JsonSerializable()
class RolloverDetailInfoBean extends Object {

  @JsonKey(name: 'interestingComradeHairIntroduction')
  double? interestingComradeHairIntroduction;

  @JsonKey(name: 'aliveHolySchool')
  int? aliveHolySchool;

  @JsonKey(name: 'pinkBaggageTuesdayPetrol')
  double? pinkBaggageTuesdayPetrol;

  @JsonKey(name: 'freeCleanerBluePineapple')
  double? freeCleanerBluePineapple;

  @JsonKey(name: 'primaryTastelessKiteDawn')
  double? primaryTastelessKiteDawn;

  @JsonKey(name: 'unusualPing')
  double? unusualPing;

  @JsonKey(name: 'squareLegGoal')
  double? squareLegGoal;

  @JsonKey(name: 'triangleRemarkIllBattery')
  double? triangleRemarkIllBattery;

  @JsonKey(name: 'passiveHis')
  int? passiveHis;

  @JsonKey(name: 'eastLipPoliceNorthernResearch')
  String? eastLipPoliceNorthernResearch;

  @JsonKey(name: 'roundUniversityAbleCartoonBriefAdult')
  double? roundUniversityAbleCartoonBriefAdult;

  @JsonKey(name: 'gladHousewifeHolyRawBattle')
  double? gladHousewifeHolyRawBattle;

  @JsonKey(name: 'blackAcheNearSealPacket')
  double? blackAcheNearSealPacket;

  @JsonKey(name: 'inlandStraightBearProudBattleground')
  double? inlandStraightBearProudBattleground;

  RolloverDetailInfoBean(this.interestingComradeHairIntroduction,this.aliveHolySchool,this.pinkBaggageTuesdayPetrol,this.freeCleanerBluePineapple,this.primaryTastelessKiteDawn,this.unusualPing,this.squareLegGoal,this.triangleRemarkIllBattery,this.passiveHis,this.eastLipPoliceNorthernResearch,this.roundUniversityAbleCartoonBriefAdult,this.gladHousewifeHolyRawBattle,this.blackAcheNearSealPacket,this.inlandStraightBearProudBattleground,);

  factory RolloverDetailInfoBean.fromJson(Map<String, dynamic> srcJson) => _$RolloverDetailInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RolloverDetailInfoBeanToJson(this);

}


