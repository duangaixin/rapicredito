import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/model/key_value_bean.dart';
import 'package:rapicredito/page/account/add/index.dart';
import 'package:rapicredito/page/account/change/index.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/custom_picker.dart';

class AddAccountCtr extends BaseGetCtr {
  final state = AddAccountState();
  TextEditingController walletAccountCtr = TextEditingController();
  TextEditingController walletAccountConfirmCtr = TextEditingController();

  TextEditingController bankAccountCtr = TextEditingController();
  TextEditingController bankAccountConfirmCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    postAppConfigInfoRequest(AppConfigClickType.collectionType);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clickWalletItemView(int index) {
    state.walletSelectIndex = index;
  }

  void showSelectBankDialog() {
    CustomPicker.showSinglePicker(Get.context!,
        data: state.accountTypeList,
        selectData: state.accountTypeList[state.accountTypeSelectIndex],
        onConfirm: (data, position) {
      if (state.accountTypeSelectIndex != position) {
        state.accountTypeSelectIndex = position;
        if (position == 0) {
          state.bankName = '';
          state.bankType = '';
          bankAccountCtr.text = '';
          bankAccountConfirmCtr.text = '';
        }
      }
    });
  }

  void postAppConfigInfoRequest(AppConfigClickType clickType) async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var typeStr = '';
    if (clickType == AppConfigClickType.bankNameList) {
      typeStr = 'bankNameList';
    } else if (clickType == AppConfigClickType.bankAccountType) {
      typeStr = 'bankAccountType';
    } else if (clickType == AppConfigClickType.collectionType) {
      typeStr = 'collectionType';
    }

    param['everydayMapleChallengingAirline'] = typeStr;
    param.addAll(getCommonParam());
    Get.showLoading();
    var response = await HttpRequestManage.instance.postAppConfigInfo(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var netList = response.data ?? [];
      if (!ObjectUtil.isEmptyList(netList)) {
        if (clickType == AppConfigClickType.collectionType) {
          state.originWalletList.addAll(netList);
          for (int i = 0; i < state.originWalletList.length; i++) {
            var bean = state.originWalletList[i];
            var type = bean.humanExpensiveBraveryHarmfulPhoto ?? '';

            if (type != '1') {
              var key = bean.latestCandle ?? '';
              var value = bean.northernMarriageCommunism ?? '';
              var keyValueBean = KeyValueBean(key: key, value: value);
              state.walletList.add(keyValueBean);
            }
          }
        }else{
          var showList = netList.map((e) => e.latestCandle).toList();
          if (!ObjectUtil.isEmptyList(showList)) {
            _showSelectDialog(showList, clickType);
          }
        }

      }
    } else {
      NetException.toastException(response);
    }
  }

  Map<String, dynamic> collectAccountParam() {
    Map<String, dynamic> param = {};
    var bankAccountType = '';
    var bankName = '';
    var bankAccountNumber = '';
    var collectionType = '';

    ///1 2 collectionType
    param['swissEnoughSaying'] = collectionType;

    ///bankName
    param['firstNurse'] = bankName;

    ///bankAccountType
    param['broadSpiritualKilometre'] = bankAccountType;

    ///bankAccountNumber
    param['dampThatTentBlankTrunk'] = bankAccountNumber;
    param.addAll(getCommonParam());
    return param;
  }

  void postSaveAccountRequest() async {
    KeyboardUtils.unFocus();
    Map<String, dynamic> param = collectAccountParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSaveAccountInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
    } else {
      NetException.toastException(response);
    }
  }

  void _showSelectDialog(List netList, AppConfigClickType clickType) {
    dynamic selectData;
    if (clickType == AppConfigClickType.bankNameList) {
      selectData = state.bankName;
    } else if (clickType == AppConfigClickType.bankAccountType) {
      selectData = state.bankType;
    } else if (clickType == AppConfigClickType.collectionType) {
      selectData = state.bankType;
    }
    CustomPicker.showSinglePicker(Get.context!, data: netList,
        onConfirm: (data, p) {
      selectData = data;
      if (clickType == AppConfigClickType.bankNameList) {
        state.bankName = data;
      }
      if (clickType == AppConfigClickType.bankAccountType) {
        state.bankType = data;
      }

      // else if (clickType == AppConfigClickType.collectionType) {
      //   state.collectionTypeValue = data;
      //   if (!ObjectUtil.isEmptyList(state.originWalletList)) {
      //     for (int i = 0; i < state.originWalletList.length; i++) {
      //       var bean = state.originWalletList[i];
      //       if (bean.latestCandle == state.collectionTypeValue) {
      //         state.collectionTypeCode = bean.humanExpensiveBraveryHarmfulPhoto ?? '';
      //         return;
      //       }
      //     }
      //   }
      // }
    }, selectData: selectData);
  }
}
