import 'package:json_annotation/json_annotation.dart';

part 'battery_info_bean.g.dart';


@JsonSerializable()
class BatteryInfoBean extends Object {

  @JsonKey(name: 'battery_health')
  int? batteryHealth;

  @JsonKey(name: 'battery_pct')
  double batteryPct;

  @JsonKey(name: 'battery_temperature')
  int? batteryTemperature;

  @JsonKey(name: 'charge_type')
  int? chargeType;

  @JsonKey(name: 'is_charging')
  int? isCharging;

  @JsonKey(name: 'screen_brightness')
  double? screenBrightness;

  BatteryInfoBean(this.batteryHealth,this.batteryPct,this.batteryTemperature,this.chargeType,this.isCharging,this.screenBrightness,);

  factory BatteryInfoBean.fromJson(Map<String, dynamic> srcJson) => _$BatteryInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BatteryInfoBeanToJson(this);

}


