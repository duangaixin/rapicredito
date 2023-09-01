import 'package:json_annotation/json_annotation.dart';

part 'location_info_bean.g.dart';


@JsonSerializable()
class LocationInfoBean extends Object {

  @JsonKey(name: 'address_details')
  String? addressDetails;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'provice')
  String? provice;

  LocationInfoBean(this.addressDetails,this.city,this.latitude,this.longitude,this.provice,);

  factory LocationInfoBean.fromJson(Map<String, dynamic> srcJson) => _$LocationInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationInfoBeanToJson(this);

}


