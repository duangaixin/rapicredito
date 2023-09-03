import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/page/loan/widget/commit_success_dialog.dart';
import 'package:rapicredito/page/loan/widget/loan_confirm_money_dialog.dart';
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
    ///金额修正
    await postAppConfigInfoRequest(AppConfigClickType.moneyDateType);

    /// 产品信息
    await postQueryProductRequest();

    ///试算
    await postTestCalculateRequest();
  }

  Future<void> postQueryProductRequest() async {
    var param = <String, dynamic>{};
    param.addAll(getCommonParam());
    var response =
        await HttpRequestManage.instance.postQueryProductInfoRequest(param);
    if (response.isSuccess()) {
      var productInfoBean = response.data;
      state.productId = productInfoBean?.brightGarbageAidsGallon ?? -1;
      var productList = productInfoBean?.skillfulFingerFarSide ?? [];
      if (!ObjectUtil.isEmptyList(productList)) {
        var topBean = productList[0];
        state.detailId = topBean.cleverFightSatisfactionCustom ?? -1;
        state.applyAmount = topBean.cleverMaidActualFoot ?? 0.0;
      }
    } else {
      NetException.toastException(response);
    }
  }

  Future<void> postTestCalculateRequest() async {
    var param = <String, dynamic>{};
    param['brightGarbageAidsGallon'] = state.productId;
    param['cleverFightSatisfactionCustom'] = state.detailId;
    param['funnyAustraliaTeamTale'] = state.applyAmount;
    param.addAll(getCommonParam());
    var response =
        await HttpRequestManage.instance.postTestCalculateRequest(param);
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
      NetException.toastException(response);
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
          state.configInfoDefaultValue = int.tryParse(code) ?? 0;
        }
      }
    } else {
      NetException.toastException(response);
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
      showConfirmMoneyDialog();
    } else {
      NetException.toastException(response);
    }
  }

  Future<void> postSubmitOrderRequest() async {
    var param = <String, dynamic>{};
    param['brightGarbageAidsGallon'] = state.productId;
    param['cleverFightSatisfactionCustom'] = state.detailId;
    param['funnyAustraliaTeamTale'] = state.applyAmount;

    ///orderId
    param['disabledLondonPrivatePoolAmericanInstrument'] = state.orderId;

    param.addAll(getCommonParam());
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSubmitOrderRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      showConfirmMoneyDialog();
    } else {
      NetException.toastException(response);
    }
  }

  void showConfirmMoneyDialog() {
    showDialog(
        context: Get.context!,
        builder: (_) {
          return LoanConfirmMoneyDialog(
            clickConfirm: postSubmitOrderRequest,
            amountInHand: state.amountInHand,
            loanAmount: state.loanAmount,
            repaymentDate: state.repaymentDate,
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
}
