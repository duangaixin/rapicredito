import 'package:json_annotation/json_annotation.dart';

part 'classical_surface.g.dart';


@JsonSerializable()
class ClassicalSurface extends Object {

  @JsonKey(name: 'boringToothache')
  String? boringToothache;

  @JsonKey(name: 'certainChurchDivisionRudeSide')
  int?  certainChurchDivisionRudeSide;

  @JsonKey(name: 'fancyClassShyEasyEgg')
  String?  fancyClassShyEasyEgg;

  @JsonKey(name: 'racialFoggySongInstrument')
  String?  racialFoggySongInstrument;

  @JsonKey(name: 'everydayPorterVegetableLuggage')
  String?  everydayPorterVegetableLuggage;

  @JsonKey(name: 'japanesePainfulTown')
  String?  japanesePainfulTown;

  @JsonKey(name: 'metalCloseFinalChairwoman')
  String ? metalCloseFinalChairwoman;

  @JsonKey(name: 'horribleConcertCave')
  int ? horribleConcertCave;

  @JsonKey(name: 'thoroughIdiomLameSoftballSeaweed')
  int?  thoroughIdiomLameSoftballSeaweed;

  @JsonKey(name: 'extraDistanceBreadGown')
  int ? extraDistanceBreadGown;

  @JsonKey(name: 'cloudyFamiliarCourage')
  String?  cloudyFamiliarCourage;

  @JsonKey(name: 'difficultSolidChipsFastSkin')
  String?  difficultSolidChipsFastSkin;

  @JsonKey(name: 'majorMiniskirtUnfitTemperature')
  String ? majorMiniskirtUnfitTemperature;

  @JsonKey(name: 'famousPurposeTechnicalVirtue')
  String?  famousPurposeTechnicalVirtue;

  ClassicalSurface(this.boringToothache,this.certainChurchDivisionRudeSide,this.fancyClassShyEasyEgg,this.racialFoggySongInstrument,this.everydayPorterVegetableLuggage,this.japanesePainfulTown,this.metalCloseFinalChairwoman,this.horribleConcertCave,this.thoroughIdiomLameSoftballSeaweed,this.extraDistanceBreadGown,this.cloudyFamiliarCourage,this.difficultSolidChipsFastSkin,this.majorMiniskirtUnfitTemperature,this.famousPurposeTechnicalVirtue,);

  factory ClassicalSurface.fromJson(Map<String, dynamic> srcJson) => _$ClassicalSurfaceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ClassicalSurfaceToJson(this);

}


