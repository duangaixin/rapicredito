import 'package:json_annotation/json_annotation.dart';

part 'net_work_info_bean.g.dart';


@JsonSerializable()
class NetWorkInfoBean extends Object {

  @JsonKey(name: 'ip')
  String? ip;

  @JsonKey(name: 'configuredWifiList')
  List<CurrentWifi>? configuredWifiList;

  @JsonKey(name: 'current_wifi')
  CurrentWifi? currentWifi;

  NetWorkInfoBean(this.ip,this.configuredWifiList,this.currentWifi,);

  factory NetWorkInfoBean.fromJson(Map<String, dynamic> srcJson) => _$NetWorkInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NetWorkInfoBeanToJson(this);

}





@JsonSerializable()
class CurrentWifi extends Object {

  @JsonKey(name: 'bssid')
  String? bssid;

  @JsonKey(name: 'ssid')
  String? ssid;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'mac')
  String? mac;

  CurrentWifi(this.bssid,this.ssid,this.name,this.mac,);

  factory CurrentWifi.fromJson(Map<String, dynamic> srcJson) => _$CurrentWifiFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CurrentWifiToJson(this);

}


