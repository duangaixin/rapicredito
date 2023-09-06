import 'package:json_annotation/json_annotation.dart';

part 'home_product_info_bean.g.dart';


@JsonSerializable()
class HomeProductInfoBean extends Object {

  @JsonKey(name: 'skillfulExpressionSaltyYard')
  ///appSsid
  String? skillfulExpressionSaltyYard;

  @JsonKey(name: 'bornDoubleShallowAcheActiveSparrow')
  ///logoUrl
  String? bornDoubleShallowAcheActiveSparrow;

  @JsonKey(name: 'passiveHis')
  ///extendDuration
  int? passiveHis;

  @JsonKey(name: 'disabledLondonPrivatePoolAmericanInstrument')
  ///orderId
  int? disabledLondonPrivatePoolAmericanInstrument;

  @JsonKey(name: 'unfitImpressionSingleHandSuchElectricity')
  ///appName
  String? unfitImpressionSingleHandSuchElectricity;

  @JsonKey(name: 'cleverMaidActualFoot')
  ///maxCreditAmount
  double? cleverMaidActualFoot;

  @JsonKey(name: 'smokeCampSpanishLift')
  ///curUserId
  int? smokeCampSpanishLift;

  @JsonKey(name: 'shortHelmetModernLatterGiftedDifference')
  ///viewStatus
  String? shortHelmetModernLatterGiftedDifference;

  HomeProductInfoBean(this.skillfulExpressionSaltyYard,this.bornDoubleShallowAcheActiveSparrow,this.passiveHis,this.disabledLondonPrivatePoolAmericanInstrument,this.unfitImpressionSingleHandSuchElectricity,this.cleverMaidActualFoot,this.smokeCampSpanishLift,this.shortHelmetModernLatterGiftedDifference,);

  factory HomeProductInfoBean.fromJson(Map<String, dynamic> srcJson) => _$HomeProductInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeProductInfoBeanToJson(this);

}


