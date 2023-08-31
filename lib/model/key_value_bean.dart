import 'package:json_annotation/json_annotation.dart';

part 'key_value_bean.g.dart';


@JsonSerializable()
class KeyValueBean extends Object {

  @JsonKey(name: 'key')
  String? key;

  @JsonKey(name: 'value')
  String? value;

  KeyValueBean(this.key,this.value,);

  factory KeyValueBean.fromJson(Map<String, dynamic> srcJson) => _$KeyValueBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KeyValueBeanToJson(this);

}

  
