import 'package:json_annotation/json_annotation.dart';

part 'hardware_info_bean.g.dart';

@JsonSerializable()
class HardwareInfoBean extends Object {
  @JsonKey(name: 'imei1')
  String? imei1;
  @JsonKey(name: 'imei2')
  String? imei2;
  @JsonKey(name: 'cpu_num')
  int? cpuNum;
  @JsonKey(name: 'abis')
  String? abis;

  @JsonKey(name: 'base_os')
  String? baseOs;

  @JsonKey(name: 'baseband_ver')
  String? basebandVer;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'bootloader')
  String? bootloader;

  @JsonKey(name: 'brand')
  String? brand;

  @JsonKey(name: 'cpu_abi')
  String? cpuAbi;

  @JsonKey(name: 'cpu_abi2')
  String? cpuAbi2;

  @JsonKey(name: 'cpu_cur')
  String? cpuCur;

  @JsonKey(name: 'cpu_max')
  String? cpuMax;

  @JsonKey(name: 'cpu_min')
  String? cpuMin;

  @JsonKey(name: 'cpu_type')
  String? cpuType;

  @JsonKey(name: 'device')
  String? device;

  @JsonKey(name: 'display')
  String? display;

  @JsonKey(name: 'finger_print')
  String? fingerPrint;

  @JsonKey(name: 'hardware')
  String? hardware;

  @JsonKey(name: 'host')
  String? host;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'is_tablet')
  int? isTablet;

  @JsonKey(name: 'manufacturer_name')
  String? manufacturerName;

  @JsonKey(name: 'model')
  String? model;

  @JsonKey(name: 'physical_size')
  String? physicalSize;

  @JsonKey(name: 'product')
  String? product;

  @JsonKey(name: 'radio_version')
  String? radioVersion;

  @JsonKey(name: 'release')
  String? release;

  @JsonKey(name: 'resolution')
  String? resolution;

  @JsonKey(name: 'screen_density')
  String? screenDensity;

  @JsonKey(name: 'screen_density_dpi')
  String? screenDensityDpi;

  @JsonKey(name: 'sdkVersionCode')
  String? sdkVersionCode;

  @JsonKey(name: 'serial_number')
  String? serialNumber;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'time')
  String? time;

  @JsonKey(name: 'type')
  String? type;

  @JsonKey(name: 'user')
  String? user;

  HardwareInfoBean(
    this.imei1,
    this.imei2,
    this.cpuNum,
    this.abis,
    this.baseOs,
    this.basebandVer,
    this.board,
    this.bootloader,
    this.brand,
    this.cpuAbi,
    this.cpuAbi2,
    this.cpuCur,
    this.cpuMax,
    this.cpuMin,
    this.cpuType,
    this.device,
    this.display,
    this.fingerPrint,
    this.hardware,
    this.host,
    this.id,
    this.isTablet,
    this.manufacturerName,
    this.model,
    this.physicalSize,
    this.product,
    this.radioVersion,
    this.release,
    this.resolution,
    this.screenDensity,
    this.screenDensityDpi,
    this.sdkVersionCode,
    this.serialNumber,
    this.tags,
    this.time,
    this.type,
    this.user,
  );

  factory HardwareInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HardwareInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HardwareInfoBeanToJson(this);
}
