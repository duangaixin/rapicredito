import 'package:json_annotation/json_annotation.dart';

part 'account_info_bean.g.dart';


@JsonSerializable()
class AccountInfoBean extends Object {

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'type')
  String? type;

  AccountInfoBean(this.name,this.type,);

  factory AccountInfoBean.fromJson(Map<String, dynamic> srcJson) => _$AccountInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountInfoBeanToJson(this);

}


