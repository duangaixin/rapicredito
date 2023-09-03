import 'package:json_annotation/json_annotation.dart';

part 'pre_submit_order_bean.g.dart';


@JsonSerializable()
class PreSubmitOrderBean extends Object {

  @JsonKey(name: 'looseBunFacialSaladNeatAlarm')
  String? looseBunFacialSaladNeatAlarm;

  @JsonKey(name: 'disabledLondonPrivatePoolAmericanInstrument')
  int? disabledLondonPrivatePoolAmericanInstrument;

  @JsonKey(name: 'mildSomeBathtub')
  String? mildSomeBathtub;

  @JsonKey(name: 'enoughBrickDoor')
  int? enoughBrickDoor;

  @JsonKey(name: 'folkElephantBotany')
  List<FolkElephantBotany>? folkElephantBotany;

  PreSubmitOrderBean(this.looseBunFacialSaladNeatAlarm,this.disabledLondonPrivatePoolAmericanInstrument,this.mildSomeBathtub,this.enoughBrickDoor,this.folkElephantBotany,);

  factory PreSubmitOrderBean.fromJson(Map<String, dynamic> srcJson) => _$PreSubmitOrderBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PreSubmitOrderBeanToJson(this);

}


@JsonSerializable()
class FolkElephantBotany extends Object {

  @JsonKey(name: 'africanDessertUncertainThisRank')
  String? africanDessertUncertainThisRank;

  @JsonKey(name: 'hopelessBritainBoringHaircut')
  String? hopelessBritainBoringHaircut;

  @JsonKey(name: 'northernMarriageCommunism')
  String? northernMarriageCommunism;

  @JsonKey(name: 'communistBuddhistZooExtraCellar')
  String? communistBuddhistZooExtraCellar;

  FolkElephantBotany(this.africanDessertUncertainThisRank,this.hopelessBritainBoringHaircut,this.northernMarriageCommunism,this.communistBuddhistZooExtraCellar,);

  factory FolkElephantBotany.fromJson(Map<String, dynamic> srcJson) => _$FolkElephantBotanyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FolkElephantBotanyToJson(this);

}


