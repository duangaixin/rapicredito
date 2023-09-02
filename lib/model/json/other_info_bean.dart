import 'package:json_annotation/json_annotation.dart';

part 'other_info_bean.g.dart';


@JsonSerializable()
class OtherInfoBean extends Object {

  @JsonKey(name: 'dbm')
  String? dbm;

  @JsonKey(name: 'http_proxy_host_port')
  String? httpProxyHostPort;

  @JsonKey(name: 'is_airplane_mode')
  int? isAirplaneMode;

  @JsonKey(name: 'is_mock_location')
  int? isMockLocation;

  @JsonKey(name: 'is_usb_debug')
  int? isUsbDebug;

  @JsonKey(name: 'is_using_proxy_port')
  int? isUsingProxyPort;

  @JsonKey(name: 'is_using_vpn')
  int? isUsingVpn;

  @JsonKey(name: 'keyboard')
  int? keyboard;

  @JsonKey(name: 'last_boot_time')
  int? lastBootTime;

  @JsonKey(name: 'ringer_mode')
  int? ringerMode;

  @JsonKey(name: 'root_jailbreak')
  int? rootJailbreak;

  @JsonKey(name: 'simulator')
  int? simulator;

  @JsonKey(name: 'vpn_address')
  String? vpnAddress;

  OtherInfoBean(this.dbm,this.httpProxyHostPort,this.isAirplaneMode,this.isMockLocation,this.isUsbDebug,this.isUsingProxyPort,this.isUsingVpn,this.keyboard,this.lastBootTime,this.ringerMode,this.rootJailbreak,this.simulator,this.vpnAddress,);

  factory OtherInfoBean.fromJson(Map<String, dynamic> srcJson) => _$OtherInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OtherInfoBeanToJson(this);

}


