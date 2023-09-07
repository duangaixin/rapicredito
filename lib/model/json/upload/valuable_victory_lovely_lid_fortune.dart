import 'package:json_annotation/json_annotation.dart';

part 'valuable_victory_lovely_lid_fortune.g.dart';

///ip
@JsonSerializable()
class ValuableVictoryLovelyLidFortune extends Object {

  @JsonKey(name: 'nationalGuardEitherMinority')
  String? nationalGuardEitherMinority;

  @JsonKey(name: 'likelyScienceThatVirtue')
  String? likelyScienceThatVirtue;

  ValuableVictoryLovelyLidFortune(this.nationalGuardEitherMinority,this.likelyScienceThatVirtue,);

  factory ValuableVictoryLovelyLidFortune.fromJson(Map<String, dynamic> srcJson) => _$ValuableVictoryLovelyLidFortuneFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ValuableVictoryLovelyLidFortuneToJson(this);

}


