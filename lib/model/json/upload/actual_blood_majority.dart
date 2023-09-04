import 'package:json_annotation/json_annotation.dart';

part 'actual_blood_majority.g.dart';


@JsonSerializable()
class ActualBloodMajority extends Object {

  @JsonKey(name: 'dearMomentSilentInkTheme')
  String? dearMomentSilentInkTheme;

  @JsonKey(name: 'noisyHealthyAvenueCastle')
  String ?noisyHealthyAvenueCastle;

  @JsonKey(name: 'freePieceFastIdiom')
  String? freePieceFastIdiom;

  @JsonKey(name: 'followingStewardBlackConclusion')
  String? followingStewardBlackConclusion;

  ActualBloodMajority(this.dearMomentSilentInkTheme,this.noisyHealthyAvenueCastle,this.freePieceFastIdiom,this.followingStewardBlackConclusion,);

  factory ActualBloodMajority.fromJson(Map<String, dynamic> srcJson) => _$ActualBloodMajorityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActualBloodMajorityToJson(this);

}


