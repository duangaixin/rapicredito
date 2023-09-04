import 'package:json_annotation/json_annotation.dart';

part 'back_herb_fair_evening.g.dart';


@JsonSerializable()
class BackHerbFairEvening extends Object {

  @JsonKey(name: 'considerateCarpetCleverFairness')
  String? considerateCarpetCleverFairness;

  @JsonKey(name: 'realParcelDeadHungrySaying')
  String ?realParcelDeadHungrySaying;

  @JsonKey(name: 'strongColdLetter')
  List<FalseCattleCarefulPrinting>? strongColdLetter;

  @JsonKey(name: 'falseCattleCarefulPrinting')
  FalseCattleCarefulPrinting? falseCattleCarefulPrinting;

  BackHerbFairEvening(this.considerateCarpetCleverFairness,this.realParcelDeadHungrySaying,this.strongColdLetter,this.falseCattleCarefulPrinting,);

  factory BackHerbFairEvening.fromJson(Map<String, dynamic> srcJson) => _$BackHerbFairEveningFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BackHerbFairEveningToJson(this);

}

@JsonSerializable()
class FalseCattleCarefulPrinting extends Object {

  @JsonKey(name: 'unhealthyFrontierLastFriend')
  String? unhealthyFrontierLastFriend;

  @JsonKey(name: 'particularMailbox')
  String? particularMailbox;

  @JsonKey(name: 'sorryFirmCarbon')
  String? sorryFirmCarbon;

  @JsonKey(name: 'communistBuddhistZooExtraCellar')
  String? communistBuddhistZooExtraCellar;

  FalseCattleCarefulPrinting(this.unhealthyFrontierLastFriend,this.particularMailbox,this.sorryFirmCarbon,this.communistBuddhistZooExtraCellar,);

  factory FalseCattleCarefulPrinting.fromJson(Map<String, dynamic> srcJson) => _$FalseCattleCarefulPrintingFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FalseCattleCarefulPrintingToJson(this);

}


