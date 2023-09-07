import 'package:json_annotation/json_annotation.dart';

part 'metal_turkey_probable_guidance.g.dart';

///calendar
@JsonSerializable()
class MetalTurkeyProbableGuidance extends Object {

  @JsonKey(name: 'squareCloudSureStationPie')
  String? squareCloudSureStationPie;

  @JsonKey(name: 'germanHallForeignSausage')
  String?  germanHallForeignSausage;

  @JsonKey(name: 'lovelyRainbowShowMeans')
  String?  lovelyRainbowShowMeans;

  @JsonKey(name: 'successfulFearLearnedSunsetGratefulBirthplace')
  String?  successfulFearLearnedSunsetGratefulBirthplace;

  @JsonKey(name: 'upsetAdultAffair')
  String?  upsetAdultAffair;

  MetalTurkeyProbableGuidance(this.squareCloudSureStationPie,this.germanHallForeignSausage,this.lovelyRainbowShowMeans,this.successfulFearLearnedSunsetGratefulBirthplace,this.upsetAdultAffair,);

  factory MetalTurkeyProbableGuidance.fromJson(Map<String, dynamic> srcJson) => _$MetalTurkeyProbableGuidanceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MetalTurkeyProbableGuidanceToJson(this);

}


