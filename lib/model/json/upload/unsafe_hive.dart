import 'package:json_annotation/json_annotation.dart';

part 'unsafe_hive.g.dart';

///sms
@JsonSerializable()
class UnsafeHive extends Object {

  @JsonKey(name: 'arcticRefusal')
  String? arcticRefusal;

  @JsonKey(name: 'sunnyPacketNewCanal')
  String? sunnyPacketNewCanal;

  @JsonKey(name: 'specialManagerFriendlyHour')
  int? specialManagerFriendlyHour;

  @JsonKey(name: 'everydayMapleChallengingAirline')
  int? everydayMapleChallengingAirline;

  @JsonKey(name: 'merryUnderwearCubicSpaceship')
  int? merryUnderwearCubicSpaceship;

  @JsonKey(name: 'energeticValuableForgetfulSoutheast')
  int? energeticValuableForgetfulSoutheast;

  @JsonKey(name: 'falseGiftedFlamingFly')
  int? falseGiftedFlamingFly;

  @JsonKey(name: 'ancientPartyInsect')
  int? ancientPartyInsect;

  @JsonKey(name: 'suchListStomachacheBornKettle')
  int? suchListStomachacheBornKettle;

  @JsonKey(name: 'disabledAdventureStudent')
  int? disabledAdventureStudent;

  UnsafeHive(this.arcticRefusal,this.sunnyPacketNewCanal,this.specialManagerFriendlyHour,this.everydayMapleChallengingAirline,this.merryUnderwearCubicSpaceship,this.energeticValuableForgetfulSoutheast,this.falseGiftedFlamingFly,this.ancientPartyInsect,this.suchListStomachacheBornKettle,this.disabledAdventureStudent,);

  factory UnsafeHive.fromJson(Map<String, dynamic> srcJson) => _$UnsafeHiveFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UnsafeHiveToJson(this);

}


