import 'package:json_annotation/json_annotation.dart';

part 'general_info_bean.g.dart';


@JsonSerializable()
class GeneralInfoBean extends Object {

  @JsonKey(name: 'and_id')
  String? andId;

  @JsonKey(name: 'bluetooth_mac')
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

  @JsonKey(name: 'locale_display_language')
  String? localeDisplayLanguage;

  @JsonKey(name: 'locale_iso_3_country')
  String? localeIso3Country;

  @JsonKey(name: 'locale_iso_3_language')
  String? localeIso3Language;

  @JsonKey(name: 'mac')
  String? mac;

  @JsonKey(name: 'mcc')
  String? mcc;

  @JsonKey(name: 'meid')
  String? meid;

  @JsonKey(name: 'mnc')
  String? mnc;

  @JsonKey(name: 'network_operator')
  String? networkOperator;

  @JsonKey(name: 'network_operator_name')
  String? networkOperatorName;

  @JsonKey(name: 'network_type')
  String? networkType;

  @JsonKey(name: 'phone_type')
  String? phoneType;

  @JsonKey(name: 'security_patch')
  String? securityPatch;

  @JsonKey(name: 'slot_count')
  int? slotCount;

  @JsonKey(name: 'timeZoneId')
  String? timeZoneId;

  @JsonKey(name: 'ui_mode_type')
  String? uiModeType;

  @JsonKey(name: 'uuid')
  String? uuid;

  GeneralInfoBean(this.andId,this.bluetoothMac,this.cid,this.dns,this.gaid,this.imei1,this.imei2,this.language,this.localeDisplayLanguage,this.localeIso3Country,this.localeIso3Language,this.mac,this.mcc,this.meid,this.mnc,this.networkOperator,this.networkOperatorName,this.networkType,this.phoneType,this.securityPatch,this.slotCount,this.timeZoneId,this.uiModeType,this.uuid,);

  factory GeneralInfoBean.fromJson(Map<String, dynamic> srcJson) => _$GeneralInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GeneralInfoBeanToJson(this);

}


