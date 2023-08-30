import 'package:json_annotation/json_annotation.dart';

part 'bank_info_bean.g.dart';


@JsonSerializable()
class BankInfoBean extends Object {

  ///bankAccountType
  @JsonKey(name: 'broadSpiritualKilometre')
  String? broadSpiritualKilometre;

  ///collectionTypeDesc
  @JsonKey(name: 'blankKeyRegulation')
  String? blankKeyRegulation;

  ///bankNameDesc
  @JsonKey(name: 'localImpossibleEffortSmoothNetwork')
  String? localImpossibleEffortSmoothNetwork;

  ///bankName 1银行名称 2电子钱包名称
  @JsonKey(name: 'firstNurse')
  String? firstNurse;

  ///bankAccountTypeDesc
  @JsonKey(name: 'saltyComfortablePlatformKingdom')
  String? saltyComfortablePlatformKingdom;

   ///collectionType 1银行卡 2钱包
  @JsonKey(name: 'swissEnoughSaying')
  String? swissEnoughSaying;

  BankInfoBean(this.broadSpiritualKilometre,this.blankKeyRegulation,this.localImpossibleEffortSmoothNetwork,this.firstNurse,this.saltyComfortablePlatformKingdom,this.swissEnoughSaying,);

  factory BankInfoBean.fromJson(Map<String, dynamic> srcJson) => _$BankInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BankInfoBeanToJson(this);

}


