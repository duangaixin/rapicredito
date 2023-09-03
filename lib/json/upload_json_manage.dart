import 'dart:convert';
import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:rapicredito/model/json/app_list_info_bean.dart';
import 'package:rapicredito/model/json/battery_info_bean.dart';
import 'package:rapicredito/model/json/general_info_bean.dart';
import 'package:rapicredito/model/json/hardware_info_bean.dart';
import 'package:rapicredito/model/json/location_info_bean.dart';
import 'package:rapicredito/model/json/media_count_info_bean.dart';
import 'package:rapicredito/model/json/net_work_info_bean.dart';
import 'package:rapicredito/model/json/other_info_bean.dart';
import 'package:rapicredito/model/json/sim_card_info_bean.dart';
import 'package:rapicredito/model/json/storage_info_bean.dart';
import 'package:rapicredito/model/json/upload_app_list_info_bean.dart';
import 'package:rapicredito/model/json/upload_battery_info_bean.dart';
import 'package:rapicredito/model/json/upload_general_info_bean.dart';
import 'package:rapicredito/model/json/upload_hardware_info_bean.dart';
import 'package:rapicredito/model/json/upload_json_bean.dart';
import 'package:rapicredito/model/json/upload_location_info_bean.dart';
import 'package:rapicredito/model/json/upload_net_info_bean.dart';
import 'package:rapicredito/model/json/upload_other_info_bean.dart';
import 'package:rapicredito/model/json/upload_storage_info_bean.dart';
import 'package:rapicredito/utils/object_util.dart';

class UploadJsonManage {
  static final UploadJsonManage instance = UploadJsonManage._internal();

  factory UploadJsonManage() {
    return instance;
  }

  UploadJsonManage._internal() {
    init();
  }

  void init() {
    MethodChannelDevicesinfo.initApp();
  }

  Future<SpokenCopJewelry> collectAllData() async {
    var jsonBean = SpokenCopJewelry();
    RedEducationProperAliveShot otherIntoBean = await getOtherDataInfo();
    ClassicalSurface hardWareInfoBean = await getHardwareInfo();
    CompressedCrossroadsTiresomeGreedyPest generalInfoBean =
        await getGeneralData();
    List<FrequentRoughPackageHunter> appInfoList = await getAppListDataInfo();
    ActualBloodMajority batteryInfoBean = await getBatteryStatusInfo();
    EnoughGeographyBroomChina storageInfoBean = await getStorageDataInfo();
    LovelyRainbowShowMeans locationInfoBean = await getLocationInfo();
    BackHerbFairEvening netWorkInfoBean=  await getNetInfo();
    MediaCountInfoBean? mediaCountInfoBean = await getMediaFileCountInfo();

       jsonBean.redEducationProperAliveShot=otherIntoBean;
    jsonBean.classicalSurface = hardWareInfoBean;
    jsonBean.enoughGeographyBroomChina = storageInfoBean;
    jsonBean.compressedCrossroadsTiresomeGreedyPest = generalInfoBean;
    jsonBean.frequentRoughPackageHunter = appInfoList;
    jsonBean.lovelyRainbowShowMeans = locationInfoBean;
    jsonBean.actualBloodMajority = batteryInfoBean;
    jsonBean.backHerbFairEvening=netWorkInfoBean;
    jsonBean.greatGymShaver = mediaCountInfoBean?.audioExternal;
    jsonBean.immediateGuideThinExpensiveJet = mediaCountInfoBean?.audioInternal;
    jsonBean.similarShelterStrictGooseProbableDay =
        mediaCountInfoBean?.imagesExternal;
    jsonBean.coldSuitableParty = mediaCountInfoBean?.videoInternal;
    jsonBean.distantActiveFriendlyTheirs = mediaCountInfoBean?.videoExternal;
    jsonBean.recentMeetingNoon = mediaCountInfoBean?.downloadFiles;
    jsonBean.secondFibreSaleswomanElectricLiberation =
        mediaCountInfoBean?.contactGroup;
    jsonBean.gratefulEncouragementCoral=[];

    return jsonBean;
  }

  ///app 一般手机信息
  Future<CompressedCrossroadsTiresomeGreedyPest> getGeneralData() async {
    var generalData = await MethodChannelDevicesinfo.getGeneralData();
    var generalInfoBean = CompressedCrossroadsTiresomeGreedyPest();
    if (!ObjectUtil.isEmptyString(generalData)) {
      var map = json.decode(generalData!);
      var bean = GeneralInfoBean.fromJson(map);
      generalInfoBean.quickUncertainLuggageUglyGoose = bean.gaid;
      generalInfoBean.theseBacteriumBlueGlasshouseSimpleUniform = bean.andId;
      generalInfoBean.dullGrandchildIllSoftMass = bean.phoneType;
      generalInfoBean.sorryFirmCarbon = bean.mac;
      generalInfoBean.suddenLiveMachinePureProfessor = bean.localeIso3Language;
      generalInfoBean.enoughSoftBookcase = bean.localeDisplayLanguage;
      generalInfoBean.silentDiscountForgetfulSouvenirs = bean.localeIso3Country;

      generalInfoBean.emptyChainFamousJewel = bean.imei1;

      ///phoneNumber
      generalInfoBean.possibleYoungPioneer = '';
      generalInfoBean.thoseSleeveSweetShameEasyCottage =
          bean.networkOperatorName;
      generalInfoBean.solidLuckyClerkTibetan = bean.networkType;
      generalInfoBean.luckyPotatoPlasticIts = bean.timeZoneId;
      generalInfoBean.contraryScientificRightNone = bean.language;

      ///elapsedRealtime
      generalInfoBean.brokenKingLeaf = 0;

      ///currentSystemTime
      generalInfoBean.minibusMinibusStraightTreasure =
          DateTime.now().millisecondsSinceEpoch;

      ///uptimeMillis
      generalInfoBean.gentleSquareSoapAnotherScholarship =
          DateTime.now().millisecondsSinceEpoch;

      ///sensor_list
      generalInfoBean.changeableConstantRelationCentigradeSunlight = [];
      print(bean);
    }

    var otherInfo = await MethodChannelDevicesinfo.getOtherData();
    if (!ObjectUtil.isEmptyString(otherInfo)) {
      var map = json.decode(otherInfo!);
      var bean = OtherInfoBean.fromJson(map);
      generalInfoBean.strangeRacialDeer = bean.isUsingProxyPort == 0;
      generalInfoBean.primaryCanadianPoisonBestEducation = bean.isUsbDebug == 0;
    }
    return generalInfoBean;
  }

  ///app list
  Future<List<FrequentRoughPackageHunter>> getAppListDataInfo() async {
    var appListDataInfo = await MethodChannelDevicesinfo.getAppListDataArmour();
    List<FrequentRoughPackageHunter> uploadAppList = [];
    if (!ObjectUtil.isEmptyString(appListDataInfo)) {
      List appList = json.decode(appListDataInfo!);
      List<AppListInfoBean> appInfoList =
          appList.map((e) => AppListInfoBean.fromJson(e)).toList();
      if (!ObjectUtil.isEmptyList(appInfoList)) {
        for (int i = 0; i < appInfoList.length; i++) {
          var bean = appInfoList[i];
          var uploadAppInfoBean = FrequentRoughPackageHunter();
          uploadAppInfoBean.followingGlasshouseJustBirdManyFlag = bean.appName;
          uploadAppInfoBean.fastChangeableStomachPepper = bean.packageName;
          uploadAppInfoBean.ancientMerchantEgg = bean.firstInstallTime;
          uploadAppInfoBean.splendidRoseHeaven = bean.versionName;
          uploadAppInfoBean.germanStreamSafeMarch = bean.appType;
          uploadAppInfoBean.firmBankCubicProfessor = bean.versionCode;
          uploadAppInfoBean.centralSpadeExample = bean.flags;
          uploadAppInfoBean.thesePlanetExperimentPlanet = bean.lastUpdateTime;
          uploadAppList.add(uploadAppInfoBean);
        }
      }
    }
    return uploadAppList;
  }

  ///电池信息
  Future<ActualBloodMajority> getBatteryStatusInfo() async {
    var batteryInfo = await MethodChannelDevicesinfo.getBatteryStatusData();
    var batteryBean = ActualBloodMajority();
    if (!ObjectUtil.isEmptyString(batteryInfo)) {
      var map = json.decode(batteryInfo!);
      var bean = BatteryInfoBean.fromJson(map);
      batteryBean.dearMomentSilentInkTheme = bean.isCharging?.toString();
      batteryBean.noisyHealthyAvenueCastle = bean.batteryPct?.toString();
      batteryBean.freePieceFastIdiom = bean.chargeType?.toString();
      batteryBean.followingStewardBlackConclusion = bean.chargeType?.toString();
      print(batteryBean);
    }
    return batteryBean;
  }

  ///硬件信息
  Future<ClassicalSurface> getHardwareInfo() async {
    var hardWareInfo = await MethodChannelDevicesinfo.getHardwareData();
    var hardwareBean = ClassicalSurface();
    if (!ObjectUtil.isEmptyString(hardWareInfo)) {
      var map = json.decode(hardWareInfo!);
      var bean = HardwareInfoBean.fromJson(map);

      hardwareBean.boringToothache = bean.device;
      hardwareBean.certainChurchDivisionRudeSide =
          int.tryParse(bean.sdkVersionCode ?? '-1');
      hardwareBean.fancyClassShyEasyEgg = bean.release;
      hardwareBean.racialFoggySongInstrument = bean.model;
      hardwareBean.everydayPorterVegetableLuggage = bean.brand;
      hardwareBean.japanesePainfulTown = bean.physicalSize;
      hardwareBean.metalCloseFinalChairwoman = bean.serialNumber;
      hardwareBean.horribleConcertCave = int.tryParse(bean.time ?? '0');

      ///device_height
      hardwareBean.thoroughIdiomLameSoftballSeaweed = 0;

      ///device_width
      hardwareBean.extraDistanceBreadGown = 0;
      hardwareBean.cloudyFamiliarCourage = bean.board;

      ///difficultSolidChipsFastSkin
      hardwareBean.difficultSolidChipsFastSkin = bean.cpuType;

      ///imei1
      hardwareBean.majorMiniskirtUnfitTemperature = '';

      ///imei2
      hardwareBean.famousPurposeTechnicalVirtue = '';
      print(bean);
    }
    return hardwareBean;
  }

  ///定位信息
  Future<LovelyRainbowShowMeans> getLocationInfo() async {
    var locationInfo = await MethodChannelDevicesinfo.getLocationAddressData();
    var locationBean = LovelyRainbowShowMeans();
    if (!ObjectUtil.isEmptyString(locationInfo)) {
      var map = json.decode(locationInfo!);
      var bean = LocationInfoBean.fromJson(map);
      locationBean.tastyDepthAdditionAverageViewer = bean.city;
      locationBean.modernFlagEmptyCottageDrug = bean.provice;
      locationBean.clearBrownActor = bean.addressDetails;
      var locationDetail = IndependentAmbulanceBurialFlag();
      locationDetail.happyHeadteacher = bean.latitude;
      locationDetail.guiltyBeanStewardessUsefulBarbershop = bean.longitude;
      locationBean.independentAmbulanceBurialFlag = locationDetail;
    }
    return locationBean;
  }

  ///获取手机文件个数
  Future<MediaCountInfoBean?> getMediaFileCountInfo() async {
    var mediaCountInfo = await MethodChannelDevicesinfo.getMediaFilesData();
    if (!ObjectUtil.isEmptyString(mediaCountInfo)) {
      var map = json.decode(mediaCountInfo!);
      var bean = MediaCountInfoBean.fromJson(map);

      print(bean);
      return bean;
    }
    return null;
  }

  ///网络信息
  Future<BackHerbFairEvening> getNetInfo() async {
    var netInfo = await MethodChannelDevicesinfo.getNetWorkData();
    var netInfoBean = BackHerbFairEvening();
    if (!ObjectUtil.isEmptyString(netInfo)) {
      var map = json.decode(netInfo!);
      var bean = NetWorkInfoBean.fromJson(map);
      var wifi = CottonFrenchFrontLid();
      wifi.unhealthyFrontierLastFriend = bean.currentWifi?.bssid;
      wifi.particularMailbox = bean.currentWifi?.ssid;
      wifi.sorryFirmCarbon = bean.currentWifi?.mac;
      wifi.communistBuddhistZooExtraCellar = bean.currentWifi?.name;
      netInfoBean.falseCattleCarefulPrinting = wifi;
      netInfoBean.considerateCarpetCleverFairness = bean.ip;
      netInfoBean.realParcelDeadHungrySaying =
          bean.configuredWifi?.length.toString();
      var list = bean.configuredWifi ?? [];
      List<CottonFrenchFrontLid>? realList = [];
      if (!ObjectUtil.isEmptyList(list)) {
        for (int i = 0; i < list.length; i++) {
          var bean = list[0];
          var bssid = bean.bssid ?? '';
          var ssid = bean.ssid ?? '';
          var mac = bean.mac ?? '';
          var name = bean.name ?? '';
          var realBean = CottonFrenchFrontLid();
          realBean.unhealthyFrontierLastFriend = bssid;
          realBean.particularMailbox = ssid;
          realBean.sorryFirmCarbon = mac;
          realBean.communistBuddhistZooExtraCellar = name;
          realList.add(realBean);
        }
        netInfoBean.strongColdLetter = realList;
      }

      print(map);
    }
    return netInfoBean;
  }

  ///手机卡
  Future<void> getSimCardInfo() async {
    var simCardInfo = await MethodChannelDevicesinfo.getSimCardData();
    if (!ObjectUtil.isEmptyString(simCardInfo)) {
      var map = json.decode(simCardInfo!);
      var bean = SimCardInfoBean.fromJson(map);
      print(bean);
    }
  }

  ///内存卡

  Future<EnoughGeographyBroomChina> getStorageDataInfo() async {
    var storageInfo = await MethodChannelDevicesinfo.getStorageData();
    var storageInfoBean = EnoughGeographyBroomChina();
    if (!ObjectUtil.isEmptyString(storageInfo)) {
      var map = json.decode(storageInfo!);
      var bean = StorageInfoBean.fromJson(map);

      storageInfoBean.cruelNobody = bean.ramTotalSize?.toString();
      storageInfoBean.australianBikeRealPassportSolidMotor =
          bean.ramUsableSize?.toString();
      storageInfoBean.broadPunishmentUncertainNeck =
          bean.memoryCardSize?.toString();
      storageInfoBean.foolishStudioHarmfulAshKing =
          (bean.memoryCardSize ?? 0 - (bean.memoryCardSizeUse ?? 0)).toString();
      storageInfoBean.excellentRedPainScotland =
          bean.memoryCardSizeUse?.toString();
      storageInfoBean.reasonableDrawingSaltLion =
          bean.internalStorageTotal?.toString();
      storageInfoBean.poorCowAncientAnimalBasicTheft =
          bean.internalStorageUsable?.toString();

      ///contain_sd
      storageInfoBean.violentMelonTankerBone = 0;

      ///extra_sd
      storageInfoBean.antarcticInsectPaleRegards = 0;

      ///ram_total_pre_size
      storageInfoBean.carefulLapBucketEducator = '';

      ///app_max_memory
      storageInfoBean.extraordinaryDentistConvenientMineral = '';

      ///app_available_memory
      storageInfoBean.particularPleasantSmallMass = '';

      ///app_free_memory
      storageInfoBean.thickBoxLeg = '';
    }
    return storageInfoBean;
  }

  ///其他信息
  Future<RedEducationProperAliveShot> getOtherDataInfo() async {
    var otherInfo = await MethodChannelDevicesinfo.getOtherData();
    var otherInfoBean = RedEducationProperAliveShot();
    if (!ObjectUtil.isEmptyString(otherInfo)) {
      var map = json.decode(otherInfo!);
      var bean = OtherInfoBean.fromJson(map);
      otherInfoBean.laserTeamwork = bean.rootJailbreak?.toString();
      otherInfoBean.greekFibreSlipNoisyShaver = bean.lastBootTime?.toString();
      otherInfoBean.smoothRedRepairsGaySlip = bean.keyboard?.toString();
      otherInfoBean.classicalThickMinister = bean.simulator?.toString();
      otherInfoBean.racialChalkPainfulUniversity = bean.dbm?.toString();

      ///total_boot_time
      otherInfoBean.fairDifficultMiddlePreciousCloth = '';

      ///total_boot_time_wake
      otherInfoBean.pureMarriageNoiseThroat = '';
      print(otherInfoBean);
    }
    return otherInfoBean;
  }
}
