import 'package:json_annotation/json_annotation.dart';

part 'login_info_bean.g.dart';


@JsonSerializable()
class LoginInfoBean extends Object {

  @JsonKey(name: 'darkPlentyNervousHandbag')
  String? darkPlentyNervousHandbag;

  @JsonKey(name: 'delightedGooseFacialUnmarriedHamburger')
  ///testCustFlag
  int? delightedGooseFacialUnmarriedHamburger;

  @JsonKey(name: 'cheapFenceScholarEverydayClinic')
  ///newCustFlag
  String? cheapFenceScholarEverydayClinic;

  @JsonKey(name: 'terminalDifferentActionFatFountain')
  int? terminalDifferentActionFatFountain;

  LoginInfoBean(this.darkPlentyNervousHandbag,this.delightedGooseFacialUnmarriedHamburger,this.cheapFenceScholarEverydayClinic,this.terminalDifferentActionFatFountain,);

  factory LoginInfoBean.fromJson(Map<String, dynamic> srcJson) => _$LoginInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginInfoBeanToJson(this);

}