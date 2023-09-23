import 'package:json_annotation/json_annotation.dart';

part 'general_info_bean.g.dart';

@JsonSerializable()
class GeneralInfoBean extends Object {
  @JsonKey(name: 'androidId')
  String? andId;

  @JsonKey(name: 'bluetoothMac')
  String? bluetoothMac;

  @JsonKey(name: 'cid')
  String? cid;

  @JsonKey(name: 'dns')
  String? dns;

  @JsonKey(name: 'gaid')
  String? gaid;

  @JsonKey(name: 'imei1')
  String? imei1;

  @JsonKey(name: 'imei2')
  String? imei2;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'localeDisplayLanguage')
  String? localeDisplayLanguage;

  @JsonKey(name: 'localeIso3Country')
  String? localeIso3Country;

  @JsonKey(name: 'localeIso3Language')
  String? localeIso3Language;

  @JsonKey(name: 'mac')
  String? mac;

  @JsonKey(name: 'mcc')
  String? mcc;

  @JsonKey(name: 'meid')
  String? meid;

  @JsonKey(name: 'mnc')
  String? mnc;

  @JsonKey(name: 'networkOperator')
  String? networkOperator;

  @JsonKey(name: 'networkOperatorName')
  String? networkOperatorName;

  @JsonKey(name: 'networkType')
  String? networkType;

  @JsonKey(name: 'phoneType')
  String? phoneType;

  @JsonKey(name: 'securityPatch')
  String? securityPatch;

  @JsonKey(name: 'slotCount')
  int? slotCount;

  @JsonKey(name: 'timeZoneId')
  String? timeZoneId;

  @JsonKey(name: 'uiModeType')
  String? uiModeType;

  @JsonKey(name: 'uuid')
  String? uuid;
  @JsonKey(name: 'elapsedRealtime')
  int? elapsedRealtime;
  @JsonKey(name: 'sensorList')
  List<SensorData>? sensorList;
  @JsonKey(name: 'isUsbDebug')
  int? isUsbDebug;

  @JsonKey(name: 'isUsingProxyPort')
  int? isUsingProxyPort;
  GeneralInfoBean(
      this.andId,
      this.bluetoothMac,
      this.cid,
      this.dns,
      this.gaid,
      this.imei1,
      this.imei2,
      this.language,
      this.localeDisplayLanguage,
      this.localeIso3Country,
      this.localeIso3Language,
      this.mac,
      this.mcc,
      this.meid,
      this.mnc,
      this.networkOperator,
      this.networkOperatorName,
      this.networkType,
      this.phoneType,
      this.securityPatch,
      this.slotCount,
      this.timeZoneId,
      this.uiModeType,
      this.uuid,
      this.elapsedRealtime,
      this.sensorList,
      this.isUsbDebug,
      this.isUsingProxyPort
      );

  factory GeneralInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$GeneralInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GeneralInfoBeanToJson(this);
}

@JsonSerializable()
class SensorData extends Object {
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
  String? vendor;

  @JsonKey(name: 'version')
  int? version;

  SensorData(
    this.maxRange,
    this.minDelay,
    this.name,
    this.power,
    this.resolution,
    this.type,
    this.vendor,
    this.version,
  );

  factory SensorData.fromJson(Map<String, dynamic> srcJson) =>
      _$SensorDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SensorDataToJson(this);
}
