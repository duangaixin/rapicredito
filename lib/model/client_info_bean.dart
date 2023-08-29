import 'package:json_annotation/json_annotation.dart';

part 'client_info_bean.g.dart';


@JsonSerializable()
class ClientInfoBean extends Object {

  @JsonKey(name: 'busyChimneyLiquidStadiumRectangleArithmetic')
  List<ClientInfoItemBean?>? busyChimneyLiquidStadiumRectangleArithmetic;

  @JsonKey(name: 'firmHeadteacherThoseMadamSecret')
  List<ClientInfoItemBean?>? firmHeadteacherThoseMadamSecret;

  @JsonKey(name: 'stillEmbassyVillagerReviewer')
  List<ClientInfoItemBean?>? stillEmbassyVillagerReviewer;

  @JsonKey(name: 'aggressiveExamUsedBackStove')
  String? aggressiveExamUsedBackStove;

  ClientInfoBean(this.busyChimneyLiquidStadiumRectangleArithmetic,this.firmHeadteacherThoseMadamSecret,this.stillEmbassyVillagerReviewer,this.aggressiveExamUsedBackStove,);

  factory ClientInfoBean.fromJson(Map<String, dynamic> srcJson) => _$ClientInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ClientInfoBeanToJson(this);

}


@JsonSerializable()
class ClientInfoItemBean extends Object {

  @JsonKey(name: 'everydayMapleChallengingAirline')
  String? everydayMapleChallengingAirline;

  @JsonKey(name: 'latestCandle')
  String? latestCandle;

  ClientInfoItemBean(this.everydayMapleChallengingAirline,this.latestCandle,);

  factory ClientInfoItemBean.fromJson(Map<String, dynamic> srcJson) => _$ClientInfoItemBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ClientInfoItemBeanToJson(this);

}






