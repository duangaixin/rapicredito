import 'package:json_annotation/json_annotation.dart';

part 'config_info_bean.g.dart';


@JsonSerializable()
class ConfigInfoBean extends Object {

  @JsonKey(name: 'humanExpensiveBraveryHarmfulPhoto')
  String? humanExpensiveBraveryHarmfulPhoto;

  @JsonKey(name: 'latestCandle')
  String? latestCandle;

  ConfigInfoBean(this.humanExpensiveBraveryHarmfulPhoto,this.latestCandle,);

  factory ConfigInfoBean.fromJson(Map<String, dynamic> srcJson) => _$ConfigInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ConfigInfoBeanToJson(this);

}


