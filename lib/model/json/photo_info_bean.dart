import 'package:json_annotation/json_annotation.dart';

part 'photo_info_bean.g.dart';


@JsonSerializable()
class PhotoInfoBean extends Object {

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'height')
  String? height;

  @JsonKey(name: 'width')
  String? width;

  @JsonKey(name: 'createTime')
  String? createTime;

  @JsonKey(name: 'take_time')
  String? takeTime;

  @JsonKey(name: 'save_time')
  String? saveTime;

  @JsonKey(name: 'model')
  String? model;

  @JsonKey(name: 'orientation')
  String? orientation;

  @JsonKey(name: 'x_resolution')
  String? xResolution;

  @JsonKey(name: 'y_resolution')
  String? yResolution;

  @JsonKey(name: 'gps_altitude')
  String? gpsAltitude;

  @JsonKey(name: 'gps_processing_method')
  String? gpsProcessingMethod;

  @JsonKey(name: 'lens_make')
  String? lensMake;

  @JsonKey(name: 'lens_model')
  String? lensModel;

  @JsonKey(name: 'focal_length')
  String? focalLength;

  @JsonKey(name: 'flash')
  String? flash;

  @JsonKey(name: 'software')
  String ?software;

  @JsonKey(name: 'latitude')
  String ?latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  PhotoInfoBean(this.name,this.author,this.height,this.width,this.createTime,this.takeTime,this.saveTime,this.model,this.orientation,this.xResolution,this.yResolution,this.gpsAltitude,this.gpsProcessingMethod,this.lensMake,this.lensModel,this.focalLength,this.flash,this.software,this.latitude,this.longitude,);

  factory PhotoInfoBean.fromJson(Map<String, dynamic> srcJson) => _$PhotoInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PhotoInfoBeanToJson(this);

}


