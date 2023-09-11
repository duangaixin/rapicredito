import 'package:json_annotation/json_annotation.dart';

part 'pay_url_info_bean.g.dart';


@JsonSerializable()
class PayUrlInfoBean extends Object {

  @JsonKey(name: 'northernMarriageCommunism')
  ///url
  String? northernMarriageCommunism;

  @JsonKey(name: 'humanExpensiveBraveryHarmfulPhoto')
  ///code
  String?  humanExpensiveBraveryHarmfulPhoto;

  @JsonKey(name: 'instantThatEducation')
  ///pdfUrl
  String?  instantThatEducation;

  @JsonKey(name: 'loudEndlessMexico')
  ///browserOpen
  String?  loudEndlessMexico;

  PayUrlInfoBean(this.northernMarriageCommunism,this.humanExpensiveBraveryHarmfulPhoto,this.instantThatEducation,this.loudEndlessMexico,);

  factory PayUrlInfoBean.fromJson(Map<String, dynamic> srcJson) => _$PayUrlInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PayUrlInfoBeanToJson(this);

}


