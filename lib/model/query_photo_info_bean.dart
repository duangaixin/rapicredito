import 'package:json_annotation/json_annotation.dart';

part 'query_photo_info_bean.g.dart';


@JsonSerializable()
class QueryPhotoInfoBean extends Object {

  @JsonKey(name: 'leadingUnfitHotel')
  String? leadingUnfitHotel;

  @JsonKey(name: 'hugeNeed')
  String? hugeNeed;

  @JsonKey(name: 'dueReligionFoggyCustom')
  String? dueReligionFoggyCustom;

  @JsonKey(name: 'strictKettleDowntownCheque')
  String? strictKettleDowntownCheque;

  @JsonKey(name: 'attractiveKeeperExtraYou')
  String? attractiveKeeperExtraYou;

  @JsonKey(name: 'proudCartoonAtlanticFuelSteepCustoms')
  String? proudCartoonAtlanticFuelSteepCustoms;

  @JsonKey(name: 'followingPastBoatingApology')
  String? followingPastBoatingApology;

  @JsonKey(name: 'names')
  String? names;

  @JsonKey(name: 'terminalFrontierArcticHomeland')
  String? terminalFrontierArcticHomeland;

  @JsonKey(name: 'ripeCloseToughMonument')
  String? ripeCloseToughMonument;

  @JsonKey(name: 'deepJuicyStomach')
  String? deepJuicyStomach;

  @JsonKey(name: 'digestGrandSemicircle')
  String? digestGrandSemicircle;

  @JsonKey(name: 'tastelessAmericanPlateCattle')
  String? tastelessAmericanPlateCattle;

  @JsonKey(name: 'asleepNuclearRiddleBritishSubtraction')
  String? asleepNuclearRiddleBritishSubtraction;

  @JsonKey(name: 'hungryDoorHer')
  String? hungryDoorHer;

  @JsonKey(name: 'surnames')
  String? surnames;

  @JsonKey(name: 'excellentSummerDisabledCamp')
  String? excellentSummerDisabledCamp;

  QueryPhotoInfoBean(this.leadingUnfitHotel,this.hugeNeed,this.dueReligionFoggyCustom,this.strictKettleDowntownCheque,this.attractiveKeeperExtraYou,this.proudCartoonAtlanticFuelSteepCustoms,this.followingPastBoatingApology,this.names,this.terminalFrontierArcticHomeland,this.ripeCloseToughMonument,this.deepJuicyStomach,this.digestGrandSemicircle,this.tastelessAmericanPlateCattle,this.asleepNuclearRiddleBritishSubtraction,this.hungryDoorHer,this.surnames,this.excellentSummerDisabledCamp,);

  factory QueryPhotoInfoBean.fromJson(Map<String, dynamic> srcJson) => _$QueryPhotoInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QueryPhotoInfoBeanToJson(this);

}


