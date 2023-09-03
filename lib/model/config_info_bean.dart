import 'package:json_annotation/json_annotation.dart';

part 'config_info_bean.g.dart';


@JsonSerializable()
class ConfigInfoBean extends Object {

  ///code
  @JsonKey(name: 'humanExpensiveBraveryHarmfulPhoto')
  String? humanExpensiveBraveryHarmfulPhoto;
///value
  @JsonKey(name: 'latestCandle')
  String? latestCandle;
  ///url
  @JsonKey(name: 'northernMarriageCommunism')
  String? northernMarriageCommunism;
  ConfigInfoBean(this.humanExpensiveBraveryHarmfulPhoto,this.latestCandle,this.northernMarriageCommunism);

  factory ConfigInfoBean.fromJson(Map<String, dynamic> srcJson) => _$ConfigInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ConfigInfoBeanToJson(this);

}


