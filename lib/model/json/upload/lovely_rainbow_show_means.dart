import 'package:json_annotation/json_annotation.dart';

part 'lovely_rainbow_show_means.g.dart';


@JsonSerializable()
class LovelyRainbowShowMeans extends Object {

  @JsonKey(name: 'tastyDepthAdditionAverageViewer')
  String? tastyDepthAdditionAverageViewer;

  @JsonKey(name: 'modernFlagEmptyCottageDrug')
  String? modernFlagEmptyCottageDrug;

  @JsonKey(name: 'clearBrownActor')
  String? clearBrownActor;

  @JsonKey(name: 'independentAmbulanceBurialFlag')
  IndependentAmbulanceBurialFlag? independentAmbulanceBurialFlag;

  LovelyRainbowShowMeans(this.tastyDepthAdditionAverageViewer,this.modernFlagEmptyCottageDrug,this.clearBrownActor,this.independentAmbulanceBurialFlag,);

  factory LovelyRainbowShowMeans.fromJson(Map<String, dynamic> srcJson) => _$LovelyRainbowShowMeansFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LovelyRainbowShowMeansToJson(this);

}


@JsonSerializable()
class IndependentAmbulanceBurialFlag extends Object {

  @JsonKey(name: 'happyHeadteacher')
  String? happyHeadteacher;

  @JsonKey(name: 'guiltyBeanStewardessUsefulBarbershop')
  String? guiltyBeanStewardessUsefulBarbershop;

  IndependentAmbulanceBurialFlag(this.happyHeadteacher,this.guiltyBeanStewardessUsefulBarbershop,);

  factory IndependentAmbulanceBurialFlag.fromJson(Map<String, dynamic> srcJson) => _$IndependentAmbulanceBurialFlagFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndependentAmbulanceBurialFlagToJson(this);

}


