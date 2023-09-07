import 'package:json_annotation/json_annotation.dart';

part 'sms_info_bean.g.dart';


@JsonSerializable()
class SmsInfoBean extends Object {

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'time')
  int? time;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: '_id')
  int? id;

  @JsonKey(name: 'date_sent')
  int? dateSent;

  @JsonKey(name: 'read')
  int? read;

  @JsonKey(name: 'seen')
  int? seen;

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'person')
  int? person;

  SmsInfoBean(this.phone,this.content,this.time,this.type,this.id,this.dateSent,this.read,this.seen,this.status,this.person,);

  factory SmsInfoBean.fromJson(Map<String, dynamic> srcJson) => _$SmsInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SmsInfoBeanToJson(this);

}


