import 'package:json_annotation/json_annotation.dart';

part 'furnished_airplane_savage_punctual_actress.g.dart';

///account
@JsonSerializable()
class FurnishedAirplaneSavagePunctualActress extends Object {

  @JsonKey(name: 'communistBuddhistZooExtraCellar')
  String? communistBuddhistZooExtraCellar;

  @JsonKey(name: 'everydayMapleChallengingAirline')
  String? everydayMapleChallengingAirline;

  FurnishedAirplaneSavagePunctualActress(this.communistBuddhistZooExtraCellar,this.everydayMapleChallengingAirline,);

  factory FurnishedAirplaneSavagePunctualActress.fromJson(Map<String, dynamic> srcJson) => _$FurnishedAirplaneSavagePunctualActressFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FurnishedAirplaneSavagePunctualActressToJson(this);

}


