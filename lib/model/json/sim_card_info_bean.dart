import 'package:json_annotation/json_annotation.dart';

part 'sim_card_info_bean.g.dart';


@JsonSerializable()
class SimCardInfoBean extends Object {

  @JsonKey(name: 'imsi1')
  String imsi1;

  @JsonKey(name: 'imsi2')
  String imsi2;

  @JsonKey(name: 'number1')
  String number1;

  @JsonKey(name: 'number2')
  String number2;

  @JsonKey(name: 'sim_count')
  int simCount;

  @JsonKey(name: 'sim_country_iso1')
  String simCountryIso1;

  @JsonKey(name: 'sim_country_iso2')
  String simCountryIso2;

  @JsonKey(name: 'sim_serial_number1')
  String simSerialNumber1;

  @JsonKey(name: 'sim_serial_number2')
  String simSerialNumber2;

  SimCardInfoBean(this.imsi1,this.imsi2,this.number1,this.number2,this.simCount,this.simCountryIso1,this.simCountryIso2,this.simSerialNumber1,this.simSerialNumber2,);

  factory SimCardInfoBean.fromJson(Map<String, dynamic> srcJson) => _$SimCardInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SimCardInfoBeanToJson(this);

}


