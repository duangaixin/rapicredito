import 'package:json_annotation/json_annotation.dart';

part 'app_list_info_bean.g.dart';


@JsonSerializable()
class AppListInfoBean extends Object {

  @JsonKey(name: 'appName')
  String? appName;

  @JsonKey(name: 'appType')
  int? appType;

  @JsonKey(name: 'firstInstallTime')
  int? firstInstallTime;

  @JsonKey(name: 'flags')
  int? flags;

  @JsonKey(name: 'lastUpdateTime')
  int? lastUpdateTime;

  @JsonKey(name: 'packageName')
  String? packageName;

  @JsonKey(name: 'specialPermissonList')
  List<String?>? specialPermissonList;

  @JsonKey(name: 'versionCode')
  int? versionCode;

  @JsonKey(name: 'versionName')
  String? versionName;

  AppListInfoBean(this.appName,this.appType,this.firstInstallTime,this.flags,this.lastUpdateTime,this.packageName,this.specialPermissonList,this.versionCode,this.versionName,);

  factory AppListInfoBean.fromJson(Map<String, dynamic> srcJson) => _$AppListInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppListInfoBeanToJson(this);

}


