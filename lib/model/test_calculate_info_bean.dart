import 'package:json_annotation/json_annotation.dart';

part 'test_calculate_info_bean.g.dart';


@JsonSerializable()
class TestCalculateInfoBean extends Object {

  @JsonKey(name: 'farLatterInterestingLabourerLooseRunner')
  List<FarLatterInterestingLabourerLooseRunner>? farLatterInterestingLabourerLooseRunner;

  @JsonKey(name: 'everyFlashMerchantPostcodeHotTongue')
  double?  everyFlashMerchantPostcodeHotTongue;

  @JsonKey(name: 'triangleRemarkIllBattery')
  double?  triangleRemarkIllBattery;

  @JsonKey(name: 'centigradeDeal')
  double?  centigradeDeal;

  @JsonKey(name: 'technicalPastSillyAirline')
  double?  technicalPastSillyAirline;

  @JsonKey(name: 'freshBookcaseModestPing')
  double?  freshBookcaseModestPing;

  TestCalculateInfoBean(this.farLatterInterestingLabourerLooseRunner,this.everyFlashMerchantPostcodeHotTongue,this.triangleRemarkIllBattery,this.centigradeDeal,this.technicalPastSillyAirline,this.freshBookcaseModestPing,);

  factory TestCalculateInfoBean.fromJson(Map<String, dynamic> srcJson) => _$TestCalculateInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TestCalculateInfoBeanToJson(this);

}


@JsonSerializable()
class FarLatterInterestingLabourerLooseRunner extends Object {

  @JsonKey(name: 'americanHappinessBankPianist')
  ///amount
  double?  americanHappinessBankPianist;

  @JsonKey(name: 'communistBuddhistZooExtraCellar')
  ///name
  String?  communistBuddhistZooExtraCellar;

  FarLatterInterestingLabourerLooseRunner(this.americanHappinessBankPianist,this.communistBuddhistZooExtraCellar,);

  factory FarLatterInterestingLabourerLooseRunner.fromJson(Map<String, dynamic> srcJson) => _$FarLatterInterestingLabourerLooseRunnerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FarLatterInterestingLabourerLooseRunnerToJson(this);

}


