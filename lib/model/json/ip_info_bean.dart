import 'package:json_annotation/json_annotation.dart';

part 'ip_info_bean.g.dart';


@JsonSerializable()
class IpInfoBean extends Object {

  @JsonKey(name: 'firstIp')
  String? firstIp;

  @JsonKey(name: 'secondIp')
  String? secondIp;

  IpInfoBean(this.firstIp,this.secondIp,);

  factory IpInfoBean.fromJson(Map<String, dynamic> srcJson) => _$IpInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IpInfoBeanToJson(this);

}


