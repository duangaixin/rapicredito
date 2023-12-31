import 'dart:convert';
import 'package:device_identity/device_identity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:devicesinfo/devicesinfo_method_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/model/json/account_info_bean.dart';
import 'package:rapicredito/model/json/app_list_info_bean.dart';
import 'package:rapicredito/model/json/battery_info_bean.dart';
import 'package:rapicredito/model/json/calendar_info_bean.dart';
import 'package:rapicredito/model/json/general_info_bean.dart';
import 'package:rapicredito/model/json/hardware_info_bean.dart';
import 'package:rapicredito/model/json/ip_info_bean.dart';
import 'package:rapicredito/model/json/location_info_bean.dart';
import 'package:rapicredito/model/json/media_count_info_bean.dart';
import 'package:rapicredito/model/json/net_work_info_bean.dart';
import 'package:rapicredito/model/json/other_info_bean.dart';
import 'package:rapicredito/model/json/sim_card_info_bean.dart';
import 'package:rapicredito/model/json/sms_info_bean.dart';
import 'package:rapicredito/model/json/storage_info_bean.dart';
import 'package:rapicredito/model/json/upload/actual_blood_majority.dart';
import 'package:rapicredito/model/json/upload/back_herb_fair_evening.dart';
import 'package:rapicredito/model/json/upload/classical_surface.dart';
import 'package:rapicredito/model/json/upload/compressed_crossroads_tiresome_greedy_pest.dart';
import 'package:rapicredito/model/json/upload/enough_geography_broom_china.dart';
import 'package:rapicredito/model/json/upload/frequent_rough_package_hunter.dart';
import 'package:rapicredito/model/json/upload/furnished_airplane_savage_punctual_actress.dart';
import 'package:rapicredito/model/json/upload/lovely_rainbow_show_means.dart';
import 'package:rapicredito/model/json/upload/metal_turkey_probable_guidance.dart';
import 'package:rapicredito/model/json/upload/red_education_proper_alive_shot.dart';
import 'package:rapicredito/model/json/upload/spoken_cop_jewelry.dart';
import 'package:rapicredito/model/json/upload/unsafe_hive.dart';
import 'package:rapicredito/model/json/upload/valuable_victory_lovely_lid_fortune.dart';
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
    DeviceInfoChannel.initApp();
  }

  Future<SpokenCopJewelry> collectAllData() async {
    var jsonBean = SpokenCopJewelry(
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null);
    CompressedCrossroadsTiresomeGreedyPest generalInfoBean =
        await getGeneralData();
    RedEducationProperAliveShot otherIntoBean = await getOtherDataInfo();
    List<FurnishedAirplaneSavagePunctualActress> accountInfoList =
        await getAccountInfo();
    ValuableVictoryLovelyLidFortune ipInfoBean = await getIpInfo();
    List<MetalTurkeyProbableGuidance> calendarList = await getCalendarInfo();
    ClassicalSurface hardWareInfoBean = await getHardwareInfo();
    EnoughGeographyBroomChina storageInfoBean = await getStorageDataInfo();
    List<FrequentRoughPackageHunter> appInfoList = await getAppListDataInfo();
    ActualBloodMajority batteryInfoBean = await getBatteryStatusInfo();
    LovelyRainbowShowMeans locationInfoBean = await getLocationInfo();
    BackHerbFairEvening netWorkInfoBean = await getNetInfo();
    MediaCountInfoBean? mediaCountInfoBean = await getMediaFileCountInfo();
    List<UnsafeHive> smsList = await getSmsInfo();

    jsonBean.redEducationProperAliveShot = otherIntoBean;
    jsonBean.compressedCrossroadsTiresomeGreedyPest = generalInfoBean;
    jsonBean.classicalSurface = hardWareInfoBean;
    jsonBean.enoughGeographyBroomChina = storageInfoBean;

    jsonBean.frequentRoughPackageHunter = appInfoList;
    jsonBean.lovelyRainbowShowMeans = locationInfoBean;
    jsonBean.actualBloodMajority = batteryInfoBean;
    jsonBean.backHerbFairEvening = netWorkInfoBean;
    jsonBean.metalTurkeyProbableGuidance = calendarList;
    jsonBean.valuableVictoryLovelyLidFortune = ipInfoBean;
    jsonBean.unsafeHive = smsList;
    jsonBean.furnishedAirplaneSavagePunctualActress = accountInfoList;
    jsonBean.greatGymShaver = mediaCountInfoBean?.audioExternal;
    jsonBean.immediateGuideThinExpensiveJet = mediaCountInfoBean?.audioInternal;
    jsonBean.similarShelterStrictGooseProbableDay =
        mediaCountInfoBean?.imagesExternal;
    jsonBean.coldSuitableParty = mediaCountInfoBean?.videoInternal;
    jsonBean.distantActiveFriendlyTheirs = mediaCountInfoBean?.videoExternal;
    jsonBean.recentMeetingNoon = mediaCountInfoBean?.downloadFiles;
    jsonBean.secondFibreSaleswomanElectricLiberation =
        mediaCountInfoBean?.contactGroup;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    jsonBean.electricJulySafeLikelyTrial = packageInfo.packageName;
    jsonBean.foolishDearCitizenEnoughThem = packageInfo.buildNumber;
    jsonBean.greatMobileAliveAirplane = packageInfo.version;
    jsonBean.privatePersonalMudShanghai = DateTime.now().millisecondsSinceEpoch;
    return jsonBean;
  }

  ///ip
  Future<ValuableVictoryLovelyLidFortune> getIpInfo() async {
    var ipInfoStr = await DeviceInfoChannel.getIpData();
    var ipInfoBean = ValuableVictoryLovelyLidFortune(null, null);
    if (!ObjectUtil.isEmptyString(ipInfoStr)) {
      var map = json.decode(ipInfoStr!);
      var bean = IpInfoBean.fromJson(map);
      ipInfoBean.nationalGuardEitherMinority = bean.firstIp;
      ipInfoBean.likelyScienceThatVirtue = bean.secondIp;
    }
    return ipInfoBean;
  }

  ///account
  Future<List<FurnishedAirplaneSavagePunctualActress>> getAccountInfo() async {
    var accountInfoStr = await DeviceInfoChannel.getAccountData();
    List<FurnishedAirplaneSavagePunctualActress> realCalendarList = [];
    if (!ObjectUtil.isEmptyString(accountInfoStr)) {
      List appList = json.decode(accountInfoStr!);
      List<AccountInfoBean> accountInfoList =
          appList.map((e) => AccountInfoBean.fromJson(e)).toList();
      if (!ObjectUtil.isEmptyList(accountInfoList)) {
        for (int i = 0; i < accountInfoList.length; i++) {
          var bean = accountInfoList[i];
          var accountInfoBean =
              FurnishedAirplaneSavagePunctualActress(null, null);
          accountInfoBean.communistBuddhistZooExtraCellar = bean.name;
          accountInfoBean.everydayMapleChallengingAirline = bean.type;
          realCalendarList.add(accountInfoBean);
        }
      }
    }
    return realCalendarList;
  }

  Future<CompressedCrossroadsTiresomeGreedyPest> getGeneralData() async {
    var generalData = await DeviceInfoChannel.getGeneralData();
    var generalInfoBean = CompressedCrossroadsTiresomeGreedyPest(
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null);
    if (!ObjectUtil.isEmptyString(generalData)) {
      var map = json.decode(generalData!);
      var bean = GeneralInfoBean.fromJson(map);
      generalInfoBean.quickUncertainLuggageUglyGoose = bean.gaid;

      await StorageService.to.setString(AppConstants.uuidKey, bean.uuid ?? '');
      await StorageService.to.setString(AppConstants.gidKey, bean.gaid ?? '');
      generalInfoBean.theseBacteriumBlueGlasshouseSimpleUniform = bean.andId;
      generalInfoBean.dullGrandchildIllSoftMass = bean.phoneType;
      generalInfoBean.sorryFirmCarbon = bean.mac;
      generalInfoBean.suddenLiveMachinePureProfessor = bean.localeIso3Language;
      generalInfoBean.enoughSoftBookcase = bean.localeDisplayLanguage;
      generalInfoBean.silentDiscountForgetfulSouvenirs = bean.localeIso3Country;
      var deviceId = await PlatformDeviceId.getDeviceId ?? '';
      var imei = await DeviceIdentity.imei;
      if (ObjectUtil.isEmptyString(imei)) {
        imei = deviceId;
      }
      if (ObjectUtil.isEmptyString(imei)) {
        final deviceInfoPlugin = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        var serialNumber = androidInfo.serialNumber;
        imei = serialNumber;
      }
      generalInfoBean.emptyChainFamousJewel = imei;
      generalInfoBean.possibleYoungPioneer = '';
      generalInfoBean.thoseSleeveSweetShameEasyCottage =
          bean.networkOperatorName;
      generalInfoBean.solidLuckyClerkTibetan = bean.networkType;
      generalInfoBean.luckyPotatoPlasticIts = bean.timeZoneId;
      generalInfoBean.contraryScientificRightNone = bean.language;
      generalInfoBean.brokenKingLeaf = bean.elapsedRealtime;
      generalInfoBean.minibusMinibusStraightTreasure =
          DateTime.now().millisecondsSinceEpoch;
      generalInfoBean.gentleSquareSoapAnotherScholarship =
          DateTime.now().millisecondsSinceEpoch;
      generalInfoBean.heavyHelpfulSparrowPolitics = false;
      List<ChangeableConstantRelationCentigradeSunlight> dataSource = [];
      var list = bean.sensorList ?? [];
      if (!ObjectUtil.isEmptyList(list)) {
        for (int i = 0; i < list.length; i++) {
          var module = list[i];
          var bean = ChangeableConstantRelationCentigradeSunlight(
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          );
          bean.everydayMapleChallengingAirline = module.type?.toString();
          bean.communistBuddhistZooExtraCellar = module.name;
          bean.theoreticalAttractiveExactMedicine = module.version?.toString();
          bean.eastDollarChatEveryReason = module.vendor;
          bean.busyCompositionNorthwest = module.maxRange?.toString();
          bean.thirstySeaBlueProgressNumber = module.minDelay?.toString();
          bean.dueIndianBalconySpokenHome = module.power?.toString();
          bean.socialCanadianChina = module.resolution?.toString();
          dataSource.add(bean);
        }
      }
      generalInfoBean.changeableConstantRelationCentigradeSunlight = dataSource;
      generalInfoBean.strangeRacialDeer = bean.isUsingProxyPort == 0;
      generalInfoBean.primaryCanadianPoisonBestEducation = bean.isUsbDebug == 0;
    }
    return generalInfoBean;
  }

  ///sms
  Future<List<UnsafeHive>> getSmsInfo() async {
    var smsInfoStr = await DeviceInfoChannel.getSmsData();
    List<UnsafeHive> realSmsList = [];
    if (!ObjectUtil.isEmptyString(smsInfoStr)) {
      List smsList = json.decode(smsInfoStr!);
      List<SmsInfoBean> localSmsList =
          smsList.map((e) => SmsInfoBean.fromJson(e)).toList();
      if (!ObjectUtil.isEmptyList(localSmsList)) {
        for (int i = 0; i < localSmsList.length; i++) {
          var bean = localSmsList[i];
          var smsInfoBean = UnsafeHive(
              null, null, null, null, null, null, null, null, null, null);
          smsInfoBean.arcticRefusal = bean.phone;
          smsInfoBean.sunnyPacketNewCanal = bean.content;
          smsInfoBean.specialManagerFriendlyHour = bean.time;
          smsInfoBean.everydayMapleChallengingAirline = bean.type;
          smsInfoBean.merryUnderwearCubicSpaceship = bean.id;
          smsInfoBean.energeticValuableForgetfulSoutheast = bean.dateSent;
          smsInfoBean.falseGiftedFlamingFly = bean.read;
          smsInfoBean.ancientPartyInsect = bean.seen;
          smsInfoBean.suchListStomachacheBornKettle = bean.status;
          smsInfoBean.disabledAdventureStudent = bean.person;
          realSmsList.add(smsInfoBean);
        }
      }
    }
    return realSmsList;
  }

  ///calendar
  Future<List<MetalTurkeyProbableGuidance>> getCalendarInfo() async {
    var calendarInfo = await DeviceInfoChannel.getCalendarData();
    List<MetalTurkeyProbableGuidance> realCalendarList = [];
    if (!ObjectUtil.isEmptyString(calendarInfo)) {
      List appList = json.decode(calendarInfo!);
      List<CalendarInfoBean> calendarList =
          appList.map((e) => CalendarInfoBean.fromJson(e)).toList();
      if (!ObjectUtil.isEmptyList(calendarList)) {
        for (int i = 0; i < calendarList.length; i++) {
          var bean = calendarList[i];
          var calendarInfoBean =
              MetalTurkeyProbableGuidance(null, null, null, null, null);
          calendarInfoBean.squareCloudSureStationPie = bean.eventTitle;
          calendarInfoBean.germanHallForeignSausage = bean.description;
          calendarInfoBean.lovelyRainbowShowMeans = bean.location;
          calendarInfoBean.successfulFearLearnedSunsetGratefulBirthplace =
              bean.startTime;
          calendarInfoBean.upsetAdultAffair = bean.endTime;
          realCalendarList.add(calendarInfoBean);
        }
      }
    }
    return realCalendarList;
  }

  ///app list
  Future<List<FrequentRoughPackageHunter>> getAppListDataInfo() async {
    var appListDataInfo = await DeviceInfoChannel.getAppListDataArmour();
    List<FrequentRoughPackageHunter> uploadAppList = [];
    if (!ObjectUtil.isEmptyString(appListDataInfo)) {
      List appList = json.decode(appListDataInfo!);
      List<AppListInfoBean> appInfoList =
          appList.map((e) => AppListInfoBean.fromJson(e)).toList();
      if (!ObjectUtil.isEmptyList(appInfoList)) {
        for (int i = 0; i < appInfoList.length; i++) {
          var bean = appInfoList[i];
          var uploadAppInfoBean = FrequentRoughPackageHunter(
              null, null, null, null, null, null, null, null);
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

  ///battery
  Future<ActualBloodMajority> getBatteryStatusInfo() async {
    var batteryInfo = await DeviceInfoChannel.getBatteryStatusData();
    MethodChannel channel = const MethodChannel('originInfoPlugin');
    var level = await channel.invokeMethod('getBatteryLevel');
    var batteryBean = ActualBloodMajority(
      null,
      null,
      null,
      null,
    );
    if (!ObjectUtil.isEmptyString(batteryInfo)) {
      var map = json.decode(batteryInfo!);
      var bean = BatteryInfoBean.fromJson(map);
      batteryBean.dearMomentSilentInkTheme = bean.isCharging?.toString();
      // batteryBean.noisyHealthyAvenueCastle = bean.batteryPct?.toString();
      batteryBean.noisyHealthyAvenueCastle = level;
      batteryBean.freePieceFastIdiom = bean.chargeType?.toString();
      batteryBean.followingStewardBlackConclusion = bean.chargeType?.toString();
    }
    return batteryBean;
  }

  ///hardware
  Future<ClassicalSurface> getHardwareInfo() async {
    var hardWareInfo = await DeviceInfoChannel.getHardwareData();
    var hardwareBean = ClassicalSurface(
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
    if (!ObjectUtil.isEmptyString(hardWareInfo)) {
      var map = json.decode(hardWareInfo!);
      var bean = HardwareInfoBean.fromJson(map);

      hardwareBean.boringToothache = bean.device;
      hardwareBean.certainChurchDivisionRudeSide =
          int.tryParse(bean.sdkVersionCode ?? '21');
      hardwareBean.fancyClassShyEasyEgg = bean.release;
      hardwareBean.racialFoggySongInstrument = bean.model;
      hardwareBean.everydayPorterVegetableLuggage = bean.brand;
      hardwareBean.japanesePainfulTown = bean.physicalSize;
      hardwareBean.metalCloseFinalChairwoman = bean.serialNumber;
      hardwareBean.horribleConcertCave = int.tryParse(bean.time ?? '0');
      Size screenSize = MediaQuery.of(Get.context!).size;
      double devicePixelRatio = MediaQuery.of(Get.context!).devicePixelRatio;
      double deviceWidth = screenSize.width * devicePixelRatio;
      double deviceHeight = screenSize.height * devicePixelRatio;
      hardwareBean.extraDistanceBreadGown = deviceWidth.toInt();
      hardwareBean.thoroughIdiomLameSoftballSeaweed = deviceHeight.toInt();
      hardwareBean.cloudyFamiliarCourage = bean.board;
      var deviceId = await PlatformDeviceId.getDeviceId ?? '';
      var imei = await DeviceIdentity.imei;
      if (ObjectUtil.isEmptyString(imei)) {
        imei = deviceId;
      }
      if (ObjectUtil.isEmptyString(imei)) {
        final deviceInfoPlugin = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        var serialNumber = androidInfo.serialNumber;
        imei = serialNumber;
      }
      hardwareBean.majorMiniskirtUnfitTemperature = bean.imei1;
      if (ObjectUtil.isEmptyString(bean.imei1)) {
        hardwareBean.majorMiniskirtUnfitTemperature = imei;
      }
      hardwareBean.famousPurposeTechnicalVirtue = bean.imei2;
      if (ObjectUtil.isEmptyString(bean.imei2)) {
        hardwareBean.famousPurposeTechnicalVirtue = imei;
      }
      hardwareBean.difficultSolidChipsFastSkin = bean.cpuNum?.toString();
    }
    return hardwareBean;
  }

  ///location
  Future<LovelyRainbowShowMeans> getLocationInfo() async {
    var locationInfo = await DeviceInfoChannel.getLocationAddressData();
    var locationBean = LovelyRainbowShowMeans(
      null,
      null,
      null,
      null,
    );
    if (!ObjectUtil.isEmptyString(locationInfo)) {
      var map = json.decode(locationInfo!);
      var bean = LocationInfoBean.fromJson(map);
      locationBean.tastyDepthAdditionAverageViewer = bean.city;
      locationBean.modernFlagEmptyCottageDrug = bean.province;
      locationBean.clearBrownActor = bean.addressDetails;
      var locationDetail = IndependentAmbulanceBurialFlag(
        null,
        null,
      );
      locationDetail.happyHeadteacher = bean.latitude;
      locationDetail.guiltyBeanStewardessUsefulBarbershop = bean.longitude;
      locationBean.independentAmbulanceBurialFlag = locationDetail;
      await StorageService.to.setString(
          AppConstants.locationKey, '${bean.longitude},${bean.longitude}');
    }
    return locationBean;
  }

  Future<MediaCountInfoBean?> getMediaFileCountInfo() async {
    var mediaCountInfo = await DeviceInfoChannel.getMediaFilesData();
    if (!ObjectUtil.isEmptyString(mediaCountInfo)) {
      var map = json.decode(mediaCountInfo!);
      var bean = MediaCountInfoBean.fromJson(map);
      return bean;
    }
    return null;
  }

  ///net
  Future<BackHerbFairEvening> getNetInfo() async {
    var netInfo = await DeviceInfoChannel.getNetWorkData();
    var netInfoBean = BackHerbFairEvening(
      null,
      null,
      null,
      null,
    );
    if (!ObjectUtil.isEmptyString(netInfo)) {
      var map = json.decode(netInfo!);
      var bean = NetWorkInfoBean.fromJson(map);
      var wifi = FalseCattleCarefulPrinting(
        null,
        null,
        null,
        null,
      );
      wifi.unhealthyFrontierLastFriend = bean.currentWifi?.bssid;
      wifi.particularMailbox = bean.currentWifi?.ssid;
      wifi.sorryFirmCarbon = bean.currentWifi?.mac;
      wifi.communistBuddhistZooExtraCellar = bean.currentWifi?.name;
      netInfoBean.falseCattleCarefulPrinting = wifi;
      netInfoBean.considerateCarpetCleverFairness = bean.ip;
      netInfoBean.realParcelDeadHungrySaying =
          bean.configuredWifiList?.length.toString();
      var list = bean.configuredWifiList ?? [];
      List<FalseCattleCarefulPrinting>? realList = [];
      if (!ObjectUtil.isEmptyList(list)) {
        for (int i = 0; i < list.length; i++) {
          var bean = list[0];
          var bssid = bean.bssid ?? '';
          var ssid = bean.ssid ?? '';
          var mac = bean.mac ?? '';
          var name = bean.name ?? '';
          var realBean = FalseCattleCarefulPrinting(
            null,
            null,
            null,
            null,
          );
          realBean.unhealthyFrontierLastFriend = bssid;
          realBean.particularMailbox = ssid;
          realBean.sorryFirmCarbon = mac;
          realBean.communistBuddhistZooExtraCellar = name;
          realList.add(realBean);
        }
        netInfoBean.strongColdLetter = realList;
      }
    }
    return netInfoBean;
  }

  Future<void> getSimCardInfo() async {
    var simCardInfo = await DeviceInfoChannel.getSimCardData();
    if (!ObjectUtil.isEmptyString(simCardInfo)) {
      var map = json.decode(simCardInfo!);
      var bean = SimCardInfoBean.fromJson(map);
    }
  }

  Future<EnoughGeographyBroomChina> getStorageDataInfo() async {
    var storageInfo = await DeviceInfoChannel.getStorageData();
    var storageInfoBean = EnoughGeographyBroomChina(
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
    if (!ObjectUtil.isEmptyString(storageInfo)) {
      var map = json.decode(storageInfo!);
      var bean = StorageInfoBean.fromJson(map);

      storageInfoBean.cruelNobody = bean.ramTotalSize?.toString();
      storageInfoBean.australianBikeRealPassportSolidMotor =
          bean.ramUsableSize?.toString();
      storageInfoBean.broadPunishmentUncertainNeck =
          bean.memoryCardSize?.toString();
      storageInfoBean.foolishStudioHarmfulAshKing =
          bean.memoryCardUsableSize?.toString();
      storageInfoBean.excellentRedPainScotland =
          bean.memoryCardSizeUse?.toString();
      storageInfoBean.reasonableDrawingSaltLion =
          bean.internalStorageTotal?.toString();
      storageInfoBean.poorCowAncientAnimalBasicTheft =
          bean.internalStorageUsable?.toString();
      storageInfoBean.extraordinaryDentistConvenientMineral =
          bean.appMaxMemory?.toString();
      storageInfoBean.particularPleasantSmallMass =
          bean.appAvailableMemory?.toString();
      storageInfoBean.thickBoxLeg = bean.appFreeMemory?.toString();
      storageInfoBean.carefulLapBucketEducator =
          bean.ramTotalPreSize?.toString();
      storageInfoBean.violentMelonTankerBone = bean.containSd;
      storageInfoBean.antarcticInsectPaleRegards = bean.containSd == 0 ? 1 : 0;
    }
    return storageInfoBean;
  }

  Future<RedEducationProperAliveShot> getOtherDataInfo() async {
    var otherInfo = await DeviceInfoChannel.getOtherData();
    var otherInfoBean = RedEducationProperAliveShot(
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
    if (!ObjectUtil.isEmptyString(otherInfo)) {
      var map = json.decode(otherInfo!);
      var bean = OtherInfoBean.fromJson(map);
      otherInfoBean.greekFibreSlipNoisyShaver = bean.lastBootTime?.toString();
      otherInfoBean.smoothRedRepairsGaySlip = bean.keyboard?.toString();
      otherInfoBean.classicalThickMinister = bean.intSimulator?.toString();
      otherInfoBean.racialChalkPainfulUniversity = bean.dbm?.toString();
      otherInfoBean.laserTeamwork = bean.rootJailbreak?.toString();
      otherInfoBean.fairDifficultMiddlePreciousCloth =
          bean.totalBootTime?.toString();
      otherInfoBean.pureMarriageNoiseThroat =
          bean.totalBootTimeWake?.toString();
    }
    return otherInfoBean;
  }
}
