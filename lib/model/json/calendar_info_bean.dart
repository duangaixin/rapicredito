import 'package:json_annotation/json_annotation.dart';

part 'calendar_info_bean.g.dart';


@JsonSerializable()
class CalendarInfoBean extends Object {

  @JsonKey(name: 'eventTitle')
  String? eventTitle;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'startTime')
  String? startTime;

  @JsonKey(name: 'endTime')
  String? endTime;


  CalendarInfoBean(this.eventTitle,this.description,this.location,this.startTime,this.endTime);

  factory CalendarInfoBean.fromJson(Map<String, dynamic> srcJson) => _$CalendarInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CalendarInfoBeanToJson(this);

}


