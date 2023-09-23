import 'package:json_annotation/json_annotation.dart';

part 'other_info_bean.g.dart';

@JsonSerializable()
class OtherInfoBean extends Object {
  @JsonKey(name: 'totalBootTimeWake')
  int? totalBootTimeWake;
  @JsonKey(name: 'totalBootTime')
  int? totalBootTime;

  @JsonKey(name: 'dbm')
  String? dbm;

  @JsonKey(name: 'httpProxyHostPort')
  String? httpProxyHostPort;

  @JsonKey(name: 'isAirplaneMode')
  int? isAirplaneMode;

  @JsonKey(name: 'isMockLocation')
  int? isMockLocation;

  @JsonKey(name: 'isUsingVpn')
  int? isUsingVpn;

  @JsonKey(name: 'keyboard')
  int? keyboard;

  @JsonKey(name: 'lastBootTime')
  int? lastBootTime;

  @JsonKey(name: 'ringerMode')
  int? ringerMode;

  @JsonKey(name: 'rootJailbreak')
  int? rootJailbreak;

  @JsonKey(name: 'intSimulator')
  int? intSimulator;

  @JsonKey(name: 'vpnAddress')
  String? vpnAddress;

  OtherInfoBean(
    this.totalBootTimeWake,
    this.totalBootTime,
    this.dbm,
    this.httpProxyHostPort,
    this.isAirplaneMode,
    this.isMockLocation,
    this.isUsingVpn,
    this.keyboard,
    this.lastBootTime,
    this.ringerMode,
    this.rootJailbreak,
    this.intSimulator,
    this.vpnAddress,
  );

  factory OtherInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$OtherInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OtherInfoBeanToJson(this);
}
