import 'package:json_annotation/json_annotation.dart';

part 'location_info_bean.g.dart';

@JsonSerializable()
class LocationInfoBean extends Object {
  @JsonKey(name: 'addressDetails')
  String? addressDetails;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'province')
  String? province;

  LocationInfoBean(
    this.addressDetails,
    this.city,
    this.latitude,
    this.longitude,
    this.province,
  );

  factory LocationInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$LocationInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationInfoBeanToJson(this);
}
