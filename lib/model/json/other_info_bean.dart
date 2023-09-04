import 'package:json_annotation/json_annotation.dart';

part 'other_info_bean.g.dart';


@JsonSerializable()
class OtherInfoBean extends Object {

  @JsonKey(name: 'bootTime')
  int? bootTime;

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

  @JsonKey(name: 'sensorData')
  SensorData sensorData;

  @JsonKey(name: 'simulator')
  int? simulator;

  @JsonKey(name: 'vpn_address')
  String? vpnAddress;

  OtherInfoBean(this.bootTime,this.dbm,this.httpProxyHostPort,this.isAirplaneMode,this.isMockLocation,this.isUsbDebug,this.isUsingProxyPort,this.isUsingVpn,this.keyboard,this.lastBootTime,this.ringerMode,this.rootJailbreak,this.sensorData,this.simulator,this.vpnAddress,);

  factory OtherInfoBean.fromJson(Map<String, dynamic> srcJson) => _$OtherInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OtherInfoBeanToJson(this);

}


@JsonSerializable()
class SensorData extends Object {

  @JsonKey(name: 'sensor_lists')
  List<Sensor_lists>? sensorLists;

  SensorData(this.sensorLists,);

  factory SensorData.fromJson(Map<String, dynamic> srcJson) => _$SensorDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SensorDataToJson(this);

}


@JsonSerializable()
class Sensor_lists extends Object {

  @JsonKey(name: 'max_range')
  double? maxRange;

  @JsonKey(name: 'min_delay')
  int? minDelay;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'power')
  double? power;

  @JsonKey(name: 'resolution')
  double? resolution;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'vendor')
  String ?vendor;

  @JsonKey(name: 'version')
  int ?version;

  Sensor_lists(this.maxRange,this.minDelay,this.name,this.power,this.resolution,this.type,this.vendor,this.version,);

  factory Sensor_lists.fromJson(Map<String, dynamic> srcJson) => _$Sensor_listsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sensor_listsToJson(this);

}


