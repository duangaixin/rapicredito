import 'package:json_annotation/json_annotation.dart';

part 'pre_submit_order_bean.g.dart';


@JsonSerializable()
class PreSubmitOrderBean extends Object {

  @JsonKey(name: 'looseBunFacialSaladNeatAlarm')
  ///orderNo
  String? looseBunFacialSaladNeatAlarm;

  @JsonKey(name: 'disabledLondonPrivatePoolAmericanInstrument')
  ///orderId
  int? disabledLondonPrivatePoolAmericanInstrument;

  @JsonKey(name: 'mildSomeBathtub')
  ///mobile
  String? mildSomeBathtub;

  @JsonKey(name: 'enoughBrickDoor')
  ///orderStatus
  int? enoughBrickDoor;

  @JsonKey(name: 'folkElephantBotany')
  ///contractList
  List<FolkElephantBotany>? folkElephantBotany;

  PreSubmitOrderBean(this.looseBunFacialSaladNeatAlarm,this.disabledLondonPrivatePoolAmericanInstrument,this.mildSomeBathtub,this.enoughBrickDoor,this.folkElephantBotany,);

  factory PreSubmitOrderBean.fromJson(Map<String, dynamic> srcJson) => _$PreSubmitOrderBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PreSubmitOrderBeanToJson(this);

}


@JsonSerializable()
class FolkElephantBotany extends Object {

  @JsonKey(name: 'africanDessertUncertainThisRank')
  ///tip
  String? africanDessertUncertainThisRank;

  @JsonKey(name: 'hopelessBritainBoringHaircut')
  ///nameEn
  String? hopelessBritainBoringHaircut;

  @JsonKey(name: 'northernMarriageCommunism')
  ///url
  String? northernMarriageCommunism;

  @JsonKey(name: 'communistBuddhistZooExtraCellar')
  ///name
  String? communistBuddhistZooExtraCellar;

  FolkElephantBotany(this.africanDessertUncertainThisRank,this.hopelessBritainBoringHaircut,this.northernMarriageCommunism,this.communistBuddhistZooExtraCellar,);

  factory FolkElephantBotany.fromJson(Map<String, dynamic> srcJson) => _$FolkElephantBotanyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FolkElephantBotanyToJson(this);

}


