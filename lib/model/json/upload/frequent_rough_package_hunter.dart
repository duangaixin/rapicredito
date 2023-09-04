import 'package:json_annotation/json_annotation.dart';

part 'frequent_rough_package_hunter.g.dart';


@JsonSerializable()
class FrequentRoughPackageHunter extends Object {

  @JsonKey(name: 'followingGlasshouseJustBirdManyFlag')
  String? followingGlasshouseJustBirdManyFlag;

  @JsonKey(name: 'fastChangeableStomachPepper')
  String? fastChangeableStomachPepper;

  @JsonKey(name: 'ancientMerchantEgg')
  int? ancientMerchantEgg;

  @JsonKey(name: 'splendidRoseHeaven')
  String? splendidRoseHeaven;

  @JsonKey(name: 'germanStreamSafeMarch')
  int? germanStreamSafeMarch;

  @JsonKey(name: 'firmBankCubicProfessor')
  int? firmBankCubicProfessor;

  @JsonKey(name: 'centralSpadeExample')
  int? centralSpadeExample;

  @JsonKey(name: 'thesePlanetExperimentPlanet')
  int? thesePlanetExperimentPlanet;

  FrequentRoughPackageHunter(this.followingGlasshouseJustBirdManyFlag,this.fastChangeableStomachPepper,this.ancientMerchantEgg,this.splendidRoseHeaven,this.germanStreamSafeMarch,this.firmBankCubicProfessor,this.centralSpadeExample,this.thesePlanetExperimentPlanet,);

  factory FrequentRoughPackageHunter.fromJson(Map<String, dynamic> srcJson) => _$FrequentRoughPackageHunterFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FrequentRoughPackageHunterToJson(this);

}


