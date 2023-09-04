import 'package:json_annotation/json_annotation.dart';

part 'red_education_proper_alive_shot.g.dart';


@JsonSerializable()
class RedEducationProperAliveShot extends Object {

  @JsonKey(name: 'laserTeamwork')
  String? laserTeamwork;

  @JsonKey(name: 'greekFibreSlipNoisyShaver')
  String?  greekFibreSlipNoisyShaver;

  @JsonKey(name: 'smoothRedRepairsGaySlip')
  String?  smoothRedRepairsGaySlip;

  @JsonKey(name: 'classicalThickMinister')
  String?  classicalThickMinister;

  @JsonKey(name: 'racialChalkPainfulUniversity')
  String?  racialChalkPainfulUniversity;

  @JsonKey(name: 'fairDifficultMiddlePreciousCloth')
  String?  fairDifficultMiddlePreciousCloth;

  @JsonKey(name: 'pureMarriageNoiseThroat')
  String?  pureMarriageNoiseThroat;

  RedEducationProperAliveShot(this.laserTeamwork,this.greekFibreSlipNoisyShaver,this.smoothRedRepairsGaySlip,this.classicalThickMinister,this.racialChalkPainfulUniversity,this.fairDifficultMiddlePreciousCloth,this.pureMarriageNoiseThroat,);

  factory RedEducationProperAliveShot.fromJson(Map<String, dynamic> srcJson) => _$RedEducationProperAliveShotFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RedEducationProperAliveShotToJson(this);

}


