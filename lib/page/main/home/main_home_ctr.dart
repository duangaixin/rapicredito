import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/model/pay_url_info_bean.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/home_rollover_repayment_dialog.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/location_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/utils/text_util.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MainHomeCtr extends BaseGetCtr with WidgetsBindingObserver {
  MainHomeCtr();

  final mainHomeState = MainHomeState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _requestLocation();
  }

  @override
  void onReady() {
    super.onReady();
    requestInitData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        var appMainCtr = Get.find<AppMainCtr>();
        if (appMainCtr.state.pageIndex == 0) {
          requestInitData();
        }
        break;
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void _requestLocation() {
    PermissionUtil.checkPermission(
        permissionList: [
          Permission.location,
        ],
        onSuccess: () async {
          await LocationUtil.getLocation();
        },
        goSetting: () {});
  }

  Future<void> requestInitData() async {
    if (UserStore.to.hasToken) {
      await _postQueryOrderInfoRequest();
      // await postIsHomeManyProductRequest();
      // if (state.originNetList.length == 1) {
      // await _postQueryOrderInfoRequest();
      // }
    } else {
      mainHomeState.overdueStatus = -1;
      await postQueryHomeDefaultInfoRequest();
    }

    if (mainHomeState.isRefresh) {
      refreshController.refreshCompleted();
    }
  }

  void refreshInfo() {
    mainHomeState.isRefresh = true;
    requestInitData();
  }

  Future<void> _postQueryOrderInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response = await HttpRequestManage.instance.postOrderInfo(param);
    if (response.isSuccess()) {
      var bean = response.data;
     mainHomeState.feeWaiver=bean?. unusualPing??0.0;
      mainHomeState.orderId =
          bean?.disabledLondonPrivatePoolAmericanInstrument ?? -1;
      mainHomeState.overdueStatus =
          bean?.centralTechnologyAboveCarefulTomato ?? -1;
      mainHomeState.loanStatus = bean?.federalDirectorySituation ?? -1;
      mainHomeState.creditAmount = bean?.sharpStrictRelationship ?? 0.0;
      mainHomeState.applyDate = bean?.valuableRussianForestCop ?? '';
      mainHomeState.repaymentAmount =
          bean?.interestingComradeHairIntroduction ?? 0.0;
      mainHomeState.repaymentDate = bean?.indeedSoftMomEnoughPill ?? '';
      mainHomeState.interest = bean?.freshBookcaseModestPing ?? 0.0;

      mainHomeState.canRolloverPay = (bean?.endlessPie ?? '0') == '1';
      mainHomeState.rolloverPayDay = bean?.strictMedicalPuzzleCafeteria ?? 0;
      var repayTypeFlag = bean?.cottonScreamMusicalAnybody ?? '';

      mainHomeState.overduePayment = bean?.freeCleanerBluePineapple ?? 0.0;
      mainHomeState.deductCost = bean?.unsafeLicenseNut ?? 0.0;
      mainHomeState.overdueDay = bean?.mexicanMedicalCan ?? 0;

      ///delete
      // mainHomeState.overdueStatus = 1;
      // mainHomeState.canRolloverPay = true;
      // repayTypeFlag = '1,1,1,1,1';
      // mainHomeState.loadState = LoadState.succeed;

      if (mainHomeState.overdueStatus == -1) {
        await postQueryHomeDefaultInfoRequest();
        if (mainHomeState.isPaying) {
          mainHomeState.isPaying = false;
          Get.toNamed(PageRouterName.repaymentResultPage);
        }
      } else if (mainHomeState.overdueStatus == 0 ||
          mainHomeState.overdueStatus == 1) {
        mainHomeState.isPaying = false;
        if (!ObjectUtil.isEmptyString(repayTypeFlag)) {
          var payTypeList = repayTypeFlag.split(',');
          if (!ObjectUtil.isEmptyList(payTypeList)) {
            if (payTypeList.length >= 5) {
              mainHomeState.onePayShow = payTypeList[0] == '1';
              mainHomeState.twoPayShow = payTypeList[1] == '1';
              mainHomeState.threePayShow = payTypeList[2] == '1';
              mainHomeState.fourPayShow = payTypeList[3] == '1';
              mainHomeState.fivePayShow = payTypeList[4] == '1';
              mainHomeState.loadState = LoadState.succeed;
            }
          }
        }
        _addCalendarEvent();
      } else {
        mainHomeState.isPaying = false;
        mainHomeState.loadState = LoadState.succeed;
      }
    } else {
      if (response.code == null) {
        mainHomeState.overdueStatus = -1;
        mainHomeState.loadState = LoadState.succeed;
        Get.showNoNetDialog();
        return;
      }
      NetException.dealAllException(response);
    }
  }

  Future<void> _addCalendarEvent() async {
    PermissionUtil.checkPermission(
        permissionList: [
          Permission.calendar,
        ],
        onSuccess: () async {
          if (!ObjectUtil.isEmptyString(mainHomeState.repaymentDate)) {
            List<String> strList = mainHomeState.repaymentDate.split('-');
            int year = int.tryParse(strList[2]) ?? 0;
            int month = 0;
            if (strList[1].startsWith('0')) {
              var monthStr = strList[1].substring(0);
              month = int.tryParse(monthStr) ?? 0;
            } else {
              month = int.tryParse(strList[1]) ?? 0;
            }
            int day = 0;
            if (strList[0].startsWith('0')) {
              var dayStr = strList[0].substring(0);
              day = int.tryParse(dayStr) ?? 0;
            } else {
              day = int.tryParse(strList[0]) ?? 0;
            }
            var dateTime = DateTime(year, month, day);
            var reminderTime = dateTime.millisecondsSinceEpoch;
            MethodChannel channel = const MethodChannel('originInfoPlugin');
            var param = <String, Object>{};
            param
              ..['title'] = 'repayment due date'
              ..['description'] = 'repayment due date, please pay on time!'
              ..['reminderTime'] = reminderTime
              ..['previousDate'] = 0;
            await channel.invokeMethod('addCalendar', param);
          }
        },
        goSetting: () {});
  }

  Future<void> postQueryHomeDefaultInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    param['crazyPeopleReadyBravery'] = 'cleverMaidActualFoot';
    var response = await HttpRequestManage.instance.postAppSettingInfo(param);
    if (response.isSuccess()) {
      var bean = response.data;
      mainHomeState.maxAmount = bean?.cleverMaidActualFoot ?? '--';
      mainHomeState.loadState = LoadState.succeed;
    } else {
      if (response.code == null) {
        mainHomeState.overdueStatus = -1;
        mainHomeState.loadState = LoadState.succeed;
        Get.showNoNetDialog();
        return;
      }
      NetException.dealAllException(response);
    }
  }

  Future<void> postQueryRecommendListRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response =
        await HttpRequestManage.instance.postRecommendListInfo(param);
    if (response.isSuccess()) {
    } else {
      NetException.dealAllException(response);
    }
  }

  void clickPayType(PayType payType, {bool isRollover = false}) {
    _postQueryRepayUrlRequest(payType, isRollover: isRollover);
  }

  Future<void> _postQueryRepayUrlRequest(PayType payType,
      {bool isRollover = false}) async {
    Get.showLoading();
    Map<String, dynamic> param = getCommonParam();
    var payTypeStr = isRollover ? '01' : '00';
    var payMethod = '';
    if (payType == PayType.payOne) {
      payMethod = '1';
    } else if (payType == PayType.payTwo) {
      payMethod = '1';
    } else if (payType == PayType.payThree) {
      payMethod = '4';
    } else if (payType == PayType.payFour) {
      payMethod = '2';
    } else if (payType == PayType.payFive) {
      payMethod = '3';
    }
    param['terminalSongHelpfulDeadDiamond'] = payTypeStr;
    param['australianPhysicistBroadPileChart'] = payMethod;
    var response = await HttpRequestManage.instance.postRepayUrlInfo(param);
    Get.dismiss();
    if (response.isSuccess()) {
      PayUrlInfoBean? bean = response.data;
      var openUrl = '';
      if (payType == PayType.payThree) {
        openUrl = bean?.instantThatEducation ?? '';
      } else {
        openUrl = bean?.northernMarriageCommunism ?? '';
      }
      var openWay = bean?.loudEndlessMexico ?? '0';
      mainHomeState.isPaying = true;
      if (openWay == '1') {
        _openBrowser(openUrl);
      } else {
        _goToWebViewPage('', openUrl);
      }
    } else {
      mainHomeState.isPaying = false;
      NetException.dealAllException(response);
    }
  }

  Future<void> _postQueryRolloverDetailInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    param['disabledLondonPrivatePoolAmericanInstrument'] =
        mainHomeState.orderId;
    param['terminalSongHelpfulDeadDiamond'] = '01';
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postRolloverDetailInfo(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var bean = response.data;
      mainHomeState.updateDueDate = bean?.eastLipPoliceNorthernResearch ?? '';
      mainHomeState.deferralCharge =
          bean?.roundUniversityAbleCartoonBriefAdult ?? 0.0;
      mainHomeState.interest = bean?.primaryTastelessKiteDawn ?? 0.0;
      mainHomeState.overduePayment = bean?.freeCleanerBluePineapple ?? 0.0;
      mainHomeState.valueAddedTax = bean?.triangleRemarkIllBattery ?? 0.0;
      mainHomeState.payFee = bean?.interestingComradeHairIntroduction ?? 0.0;
      _showRolloverPayDialog();
    } else {
      NetException.dealAllException(response);
    }
  }

  void goToAuthPage() {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.authPersonPage);
  }

  void goToChangeAccountPage() async {
    KeyboardUtils.unFocus();
    await Get.toNamed(PageRouterName.accountPage,
        arguments: {AppConstants.isFromAddAccountKey: false});
  }

  void clickRolloverBtn() {
    _postQueryRolloverDetailInfoRequest();
  }

  void _showRolloverPayDialog() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return const HomeRolloverRepaymentDialog();
        });
  }

  String dealEndZero(String str) {
    if (!ObjectUtil.isEmptyString(str)) {
      if (str.endsWith('.0') || str.endsWith('.00')) {
        var index = str.indexOf('.');
        var newStr = str.substring(0, index);
        return newStr;
      }
    }
    return str;
  }

  String addEndZero(String str) {
    if (!ObjectUtil.isEmptyString(str)) {
      if (str.contains('.')) {
        var index = str.indexOf('.');
        var beginStr = str.substring(0, index);
        var endStr = str.substring(index + 1, str.length);
        if (num.parse(beginStr) is int) {
          var strBegin = TextUtil.formatComma3(beginStr);
          var str = '$strBegin.$endStr';
          if (str.endsWith('.0')) {
            str = '${str}0';
          }
          return str.strWithDollar();
        }
      } else {
        if (num.parse(str) is int) {
          var strBegin = TextUtil.formatComma3(str);
          return '${strBegin}00'.strWithDollar();
        }
      }
    }
    return str;
  }

  void _openBrowser(String url) async {
    if (!ObjectUtil.isEmptyString(url)) {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Cannot open $url';
      }
    }
  }

  void _goToWebViewPage(String title, String webViewUrl) async {
    KeyboardUtils.unFocus();
    await Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl,
    });
    await requestInitData();
  }

// Future<void> postIsHomeManyProductRequest() async {
//   Map<String, dynamic> param = getCommonParam();
//   var response =
//       await HttpRequestManage.instance.postIsHomeManyProductRequest(param);
//   if (response.isSuccess()) {
//     var netList = response.data ?? [];
//     if (!ObjectUtil.isEmptyList(netList)) {
//       state.originNetList
//         ..clear()
//         ..addAll(netList);
//       if (state.originNetList.length > 1) {
//         for (int i = 0; i < state.originNetList.length; i++) {
//           var bean = state.originNetList[i];
//           var status = bean.shortHelmetModernLatterGiftedDifference ?? '0';
//           if (status == '0') {
//             state.notPlaceOrderList.add(bean);
//           } else {
//             state.otherOrderList.add(bean);
//           }
//           if (!ObjectUtil.isEmptyList(state.otherOrderList)) {
//             state.dataSource.addAll(state.otherOrderList);
//           }
//
//           if (!ObjectUtil.isEmptyList(state.otherOrderList)) {}
//         }
//       }
//     }
//   } else {
//     state.loadState = LoadState.failed;
//     NetException.dealAllException(response);
//   }
// }

// Future<void> postQueryChannelListRequest() async {
//   Map<String, dynamic> param = getCommonParam();
//   var response = await HttpRequestManage.instance.postChannelListInfo(param);
//   if (response.isSuccess()) {
//   } else {
//     NetException.dealAllException(response);
//   }
// }

// Future<void> postQueryPayInfoRequest() async {
//   Map<String, dynamic> param = getCommonParam();
//   var response = await HttpRequestManage.instance.postPayInfo(param);
//   if (response.isSuccess()) {
//   } else {
//     NetException.dealAllException(response);
//   }
// }
}

enum PayType { payOne, payTwo, payThree, payFour, payFive }
