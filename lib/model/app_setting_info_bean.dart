import 'package:json_annotation/json_annotation.dart';

part 'app_setting_info_bean.g.dart';


@JsonSerializable()
class AppSettingInfoBean extends Object {

  @JsonKey(name: 'cleverMaidActualFoot')
  String? cleverMaidActualFoot;

  AppSettingInfoBean(this.cleverMaidActualFoot,);

  factory AppSettingInfoBean.fromJson(Map<String, dynamic> srcJson) => _$AppSettingInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppSettingInfoBeanToJson(this);

}


