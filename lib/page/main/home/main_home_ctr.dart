import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/home_rollover_repayment_dialog.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class MainHomeCtr extends BaseGetCtr {
  MainHomeCtr();

  final state = MainHomeState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    requestInitData();
  }

  void requestInitData() async {
    if (UserStore.to.hasToken) {
      await _postQueryOrderInfoRequest();
    } else {
      state.loanStatus = -1;
      await postQueryHomeDefaultInfoRequest();
    }

    // await postIsHomeManyProductRequest();
    // if (state.originNetList.length == 1) {
    //   await postQueryHomeDefaultInfoRequest();
    // } else {
    //   state.loadState = LoadState.succeed;
    // }
    if (state.isRefresh) {
      refreshController.refreshCompleted();
    }
  }

  void goToAuthPage() {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.authPersonPage);
  }

  void refreshInfo() {
    state.isRefresh = true;
    requestInitData();
  }

  Future<void> _postQueryOrderInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response = await HttpRequestManage.instance.postOrderInfo(param);
    if (response.isSuccess()) {
      var bean = response.data;
      state.overdueStatus = bean?.centralTechnologyAboveCarefulTomato ?? -1;
      state.loanStatus = bean?.federalDirectorySituation ?? -1;
      state.creditAmount = bean?.sharpStrictRelationship ?? 0.0;
      state.applyDate = bean?.valuableRussianForestCop ?? '';
      state.repaymentAmount = bean?.interestingComradeHairIntroduction ?? 0.0;
      state.repaymentDate = bean?.indeedSoftMomEnoughPill ?? '';
      state.interest = bean?.freshBookcaseModestPing ?? 0.0;

      state.canRolloverPay = (bean?.endlessPie ?? 0) == 1;
      state.rolloverPayDay = bean?.strictMedicalPuzzleCafeteria ?? 0;

      if (state.overdueStatus == -1) {
        await postQueryHomeDefaultInfoRequest();
      } else {
        state.loadState = LoadState.succeed;
      }
    } else {
      state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  void showRolloverPayDialog() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return const HomeRolloverRepaymentDialog();
        });
  }

  Future<void> postQueryHomeDefaultInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    param['crazyPeopleReadyBravery'] = 'cleverMaidActualFoot';
    var response = await HttpRequestManage.instance.postAppSettingInfo(param);
    if (response.isSuccess()) {
      var bean = response.data;
      state.maxAmount = bean?.cleverMaidActualFoot ?? '--';
      state.loadState = LoadState.succeed;
    } else {
      state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  void goToChangeAccountPage() {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.changeAccountPage);
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
    if (!ObjectUtil.isEmptyString(str) &&
        str.contains('.') &&
        str.endsWith('.0')) {
      return '${str}0'.strWithDollar();
    }
    return str;
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
}
