import 'package:json_annotation/json_annotation.dart';

part 'grateful_encouragement_coral.g.dart';


@JsonSerializable()
class GratefulEncouragementCoral extends Object {

  @JsonKey(name: 'roughBasketballLonelyChallengingFrog')
  int? roughBasketballLonelyChallengingFrog;

  @JsonKey(name: 'differentStick')
  String? differentStick;

  @JsonKey(name: 'laserPresentationGreenAdultRadio')
  String? laserPresentationGreenAdultRadio;

  @JsonKey(name: 'rawCarRaincoat')
  String? rawCarRaincoat;

  @JsonKey(name: 'thesePlanetExperimentPlanet')
  int? thesePlanetExperimentPlanet;

  @JsonKey(name: 'extraordinaryFurAloneBarberAliveDialogue')
  int? extraordinaryFurAloneBarberAliveDialogue;

  @JsonKey(name: 'atlanticSoldierTaxi')
  String? atlanticSoldierTaxi;

  @JsonKey(name: 'entireTheoryMexicanAbsence')
  List<String?>? entireTheoryMexicanAbsence;

  GratefulEncouragementCoral(this.roughBasketballLonelyChallengingFrog,this.differentStick,this.laserPresentationGreenAdultRadio,this.rawCarRaincoat,this.thesePlanetExperimentPlanet,this.extraordinaryFurAloneBarberAliveDialogue,this.atlanticSoldierTaxi,this.entireTheoryMexicanAbsence,);

  factory GratefulEncouragementCoral.fromJson(Map<String, dynamic> srcJson) => _$GratefulEncouragementCoralFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GratefulEncouragementCoralToJson(this);

}


