import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/model/product_info_bean.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/page/loan/widget/commit_success_dialog.dart';
import 'package:rapicredito/page/loan/widget/date_money_select_dialog.dart';
import 'package:rapicredito/page/loan/widget/loan_confirm_money_dialog.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class LoanMoneyDateCtr extends BaseGetCtr {
  final state = LoanMoneyDateState();

  @override
  void onReady() async {
    super.onReady();
    _requestInitData();
  }

  void _requestInitData() async {
    await postAppConfigInfoRequest(AppConfigClickType.moneyDateType);
    await postQueryProductRequest();
    await postTestCalculateRequest();
  }

  Future<void> postQueryProductRequest() async {
    var param = <String, dynamic>{};
    param.addAll(getCommonParam());
    var response =
        await HttpRequestManage.instance.postQueryProductInfoRequest(param);
    if (response.isSuccess()) {
      var productInfoBean = response.data;
      state.serverTime = productInfoBean?.changeableBloodFridge ?? '';
      state.productId = productInfoBean?.brightGarbageAidsGallon ?? -1;
      var productList = productInfoBean?.skillfulFingerFarSide ?? [];
      state.originList = productList;
      if (!ObjectUtil.isEmptyList(productList)) {
        var topBean = productList[0];
        state.detailId = topBean.cleverFightSatisfactionCustom ?? -1;
        state.applyAmount = topBean.cleverMaidActualFoot ?? 0.0;
        state.incrementStep =
            topBean.disabledAirmailCabRoundaboutFingernail ?? 0.0;
        _dealMoneyList(topBean);
        _dealDateList();
      }
    } else {
      NetException.dealAllException(response);
    }
  }

  void _dealDateList() {
    var testFlag = StorageService.to.getInt(AppConstants.userTestFlagKey);
    if (!ObjectUtil.isEmptyList(state.originList)) {
      List<SelectModel> allDateList = [];
      if (testFlag == 1) {
        var selectBeanOne = SelectModel();
        DateTime? dateTimeOne = DateTime.tryParse(state.serverTime);
        var realDateOne = dateTimeOne?.add(const Duration(days: 91));
        if (realDateOne != null) {
          var dateStr =
              '${realDateOne.day}-${realDateOne.month}-${realDateOne.year}';
          state.repaymentDate = selectBeanOne.dateStr = dateStr;
        }
        selectBeanOne.isSelected = true;
        selectBeanOne.canClick = true;
        allDateList.add(selectBeanOne);
        var selectBeanTwo = SelectModel();
        DateTime? dateTimeTwo = DateTime.tryParse(state.serverTime);
        var realDateTwo = dateTimeTwo?.add(const Duration(days: 91 * 2));
        if (realDateTwo != null) {
          var dateStr =
              '${realDateTwo.day}-${realDateTwo.month}-${realDateTwo.year}';
          selectBeanTwo.dateStr = dateStr;
        }
        selectBeanTwo.canClick = false;
        selectBeanTwo.isSelected = false;
        allDateList.add(selectBeanTwo);
        var selectBeanThree = SelectModel();
        DateTime? dateTimeThree = DateTime.tryParse(state.serverTime);
        var realDateThree = dateTimeThree?.add(const Duration(days: 91 * 3));
        if (realDateThree != null) {
          var dateStr =
              '${realDateThree.day}-${realDateThree.month}-${realDateThree.year}';
          selectBeanThree.dateStr = dateStr;
        }
        selectBeanThree.canClick = false;
        selectBeanThree.isSelected = false;
        allDateList.add(selectBeanThree);
      } else {
        state.durationList.clear();
        for (int i = 0; i < state.originList.length; i++) {
          var bean = state.originList[i];
          var duration = bean.strictMedicalPuzzleCafeteria ?? 0;
          state.durationList.add(duration);
          var selectBean = SelectModel();
          selectBean.isSelected = i == 0;
          selectBean.canClick = true;
          selectBean.detailId = bean.cleverFightSatisfactionCustom ?? -1;
          DateTime? dateTime = DateTime.tryParse(state.serverTime);
          var realDuration = duration + state.configInfoDateDefaultValue;
          var realDate = dateTime?.add(Duration(days: realDuration));
          if (realDate != null) {
            var dateStr = '${realDate.day}-${realDate.month}-${realDate.year}';
            state.repaymentDate = selectBean.dateStr = dateStr;
          }
          allDateList.add(selectBean);
        }

        if (allDateList.length < 2) {
          ///single
          var bean = state.originList[0];
          var duration = bean.strictMedicalPuzzleCafeteria ?? 0;
          var selectBeanOne = SelectModel();
          DateTime? dateTimeOne = DateTime.tryParse(state.serverTime);
          var realDateOne = dateTimeOne?.add(Duration(days: duration * 2));
          if (realDateOne != null) {
            var dateStr =
                '${realDateOne.day}-${realDateOne.month}-${realDateOne.year}';
            selectBeanOne.dateStr = dateStr;
          }
          selectBeanOne.canClick = false;
          selectBeanOne.isSelected = false;
          allDateList.insert(1, selectBeanOne);
          var selectBeanTwo = SelectModel();
          DateTime? dateTimeTwo = DateTime.tryParse(state.serverTime);
          var realDateTwo = dateTimeTwo?.add(Duration(days: duration * 3));
          if (realDateTwo != null) {
            var dateStr =
                '${realDateTwo.day}-${realDateTwo.month}-${realDateTwo.year}';
            selectBeanTwo.dateStr = dateStr;
          }
          selectBeanTwo.canClick = false;
          selectBeanOne.isSelected = false;
          allDateList.insert(2, selectBeanTwo);
        } else {
          ///many
          if (!ObjectUtil.isEmptyList(state.durationList)) {
            var maxDuration = state.durationList
                .reduce((curr, next) => curr > next ? curr : next);
            var minDuration = state.durationList
                .reduce((curr, next) => curr < next ? curr : next);
            var selectBeanOne = SelectModel();
            DateTime? dateTimeOne = DateTime.tryParse(state.serverTime);
            var realDateOne =
                dateTimeOne?.add(Duration(days: maxDuration + minDuration));
            if (realDateOne != null) {
              var dateStr =
                  '${realDateOne.day}-${realDateOne.month}-${realDateOne.year}';
              selectBeanOne.dateStr = dateStr;
            }
            selectBeanOne.canClick = false;
            selectBeanOne.isSelected = false;
            allDateList.insert(1, selectBeanOne);
            var selectBeanTwo = SelectModel();
            DateTime? dateTimeTwo = DateTime.tryParse(state.serverTime);
            var realDateTwo =
                dateTimeTwo?.add(Duration(days: maxDuration + 2 * minDuration));
            if (realDateTwo != null) {
              var dateStr =
                  '${realDateTwo.day}-${realDateTwo.month}-${realDateTwo.year}';
              selectBeanTwo.dateStr = dateStr;
            }
            selectBeanTwo.canClick = false;
            selectBeanTwo.isSelected = false;
            allDateList.insert(2, selectBeanTwo);
          }
        }
      }

      state.dateList
        ..clear()
        ..addAll(allDateList);
    }
  }

  void _dealMoneyList(SkillfulFingerFarSide bean) {
    List netAmountList = [];
    var minAmount = bean.spokenMaleSailor ?? 0;
    var maxAmount = bean.cleverMaidActualFoot ?? 0;
    var incrementAmount = bean.disabledAirmailCabRoundaboutFingernail ?? 0;
    if (maxAmount.compareTo(minAmount) != 0) {
      while (minAmount.compareTo(maxAmount) < 0) {
        netAmountList.add(minAmount);
        minAmount = minAmount + incrementAmount;
      }
    }
    var allMoneyList = [];
    if (!ObjectUtil.isEmptyList(netAmountList)) {
      var reverseList = List.from(netAmountList.reversed);
      allMoneyList.addAll(reverseList);
    }
    allMoneyList.insert(0, maxAmount);
    allMoneyList.insert(1, maxAmount * 2);
    allMoneyList.insert(2, maxAmount * 3);

    if (!ObjectUtil.isEmptyList(allMoneyList)) {
      state.moneyList.clear();
      for (int i = 0; i < allMoneyList.length; i++) {
        var money = allMoneyList[i];
        var selectBean = SelectModel();
        selectBean.isSelected = i == 0;
        if (i == 1 || i == 2) {
          selectBean.canClick = false;
        } else {
          selectBean.canClick = true;
        }
        selectBean.money = money;
        selectBean.itemId = i;
        state.moneyList.add(selectBean);
      }
    }
  }

  Future<void> postTestCalculateRequest({bool isShowDialog = false}) async {
    if (isShowDialog) {
      Get.showLoading();
    }
    var param = <String, dynamic>{};
    param['brightGarbageAidsGallon'] = state.productId;
    param['cleverFightSatisfactionCustom'] = state.detailId;
    param['funnyAustraliaTeamTale'] = state.applyAmount;
    param.addAll(getCommonParam());
    var response =
        await HttpRequestManage.instance.postTestCalculateRequest(param);
    if (isShowDialog) {
      Get.dismiss();
    }
    if (response.isSuccess()) {
      var bean = response.data;
      state.amountInHand =
          bean?.technicalPastSillyAirline?.toString().strWithDollar() ?? '';
      state.interest =
          bean?.freshBookcaseModestPing?.toString().strWithDollar() ?? '';
      state.serviceCharge =
          bean?.centigradeDeal?.toString().strWithDollar() ?? '';
      state.iva =
          bean?.triangleRemarkIllBattery?.toString().strWithDollar() ?? '';

      var extList = bean?.farLatterInterestingLabourerLooseRunner ?? [];
      if (!ObjectUtil.isEmptyList(extList)) {
        var amount = extList[0]
                .americanHappinessBankPianist
                ?.toString()
                .strWithDollar() ??
            '';
        state.bankServiceCharge = amount;
      }

      state.repaymentAmount = bean?.everyFlashMerchantPostcodeHotTongue
              ?.toString()
              .strWithDollar() ??
          '';
      state.loadState = LoadState.succeed;
    } else {
      state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  Future<void> postAppConfigInfoRequest(AppConfigClickType clickType) async {
    var param = <String, dynamic>{};
    var typeStr = '';
    if (clickType == AppConfigClickType.moneyDateType) {
      typeStr = 'newrealterm';
    }
    param['everydayMapleChallengingAirline'] = typeStr;
    param.addAll(getCommonParam());
    var response = await HttpRequestManage.instance.postAppConfigInfo(param);
    if (response.isSuccess()) {
      var netList = response.data ?? [];
      if (!ObjectUtil.isEmptyList(netList)) {
        if (clickType == AppConfigClickType.moneyDateType) {
          var bean = netList[0];
          var code = bean.humanExpensiveBraveryHarmfulPhoto ?? '0';
          state.configInfoDateDefaultValue = int.tryParse(code) ?? 0;
        }
      }
    } else {
      NetException.dealAllException(response);
    }
  }

  Future<void> postPreSubmitOrderRequest() async {
    var param = <String, dynamic>{};
    param['brightGarbageAidsGallon'] = state.productId;
    param['cleverFightSatisfactionCustom'] = state.detailId;
    param['funnyAustraliaTeamTale'] = state.applyAmount;
    param.addAll(getCommonParam());
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postPreSubmitOrderRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var bean = response.data;
      state.orderId = bean?.disabledLondonPrivatePoolAmericanInstrument ?? -1;
      var contractList = bean?.folkElephantBotany ?? [];
      if (!ObjectUtil.isEmptyList(contractList)) {
        var bean = contractList[0];
        state.contractName = bean.communistBuddhistZooExtraCellar ?? '';
        state.contractUrl = bean.northernMarriageCommunism ?? '';
      }
      showConfirmMoneyDialog();
    } else {
      NetException.dealAllException(response);
    }
  }

  Future<void> postSubmitOrderRequest() async {
    var param = <String, dynamic>{};
    param['brightGarbageAidsGallon'] = state.productId;
    param['cleverFightSatisfactionCustom'] = state.detailId;
    param['funnyAustraliaTeamTale'] = state.applyAmount;
    param['disabledLondonPrivatePoolAmericanInstrument'] = state.orderId;
    param.addAll(getCommonParam());
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSubmitOrderRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      showCommitSuccessDialog();
    } else {
      NetException.dealAllException(response);
    }
  }

  void showConfirmMoneyDialog() {
    showDialog(
        context: Get.context!,
        builder: (_) {
          return LoanConfirmMoneyDialog(
            clickConfirm: postSubmitOrderRequest,
            amountInHand: state.amountInHand,
            loanAmount: state.applyAmount.toString(),
            repaymentDate: state.repaymentDate,
            contractName: state.contractName,
            contractUrl: state.contractUrl,
            clickWebView: () {
              goToWebViewPage(state.contractName, state.contractUrl);
            },
          );
        });
  }

  void showCommitSuccessDialog() {
    showDialog(
        context: Get.context!,
        builder: (_) {
          return const CommitSuccessDialog();
        });
  }
  void showDateMoneySelectDialog() {
    showDialog(
        context: Get.context!,
        builder: (_) {
          return const DateMoneySelectDialog();
        });
  }
  void goToWebViewPage(String title, String webViewUrl) {
    Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl
    });
  }
}

class SelectModel {
  var isSelected = false;
  var canClick = true;
  var money = 0.0;
  var dateStr = '';
  var itemId = -1;
  var detailId = -1;
}
