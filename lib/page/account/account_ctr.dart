import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/model/key_value_bean.dart';
import 'package:rapicredito/page/account/index.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_picker.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';


class AccountCtr extends BaseGetCtr {
  final state = AccountState();
  TextEditingController walletAccountCtr = TextEditingController();
  TextEditingController walletAccountConfirmCtr = TextEditingController();

  TextEditingController bankAccountCtr = TextEditingController();
  TextEditingController bankAccountConfirmCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (state.walletSelectIndex == 0) {
      walletAccountCtr.addListener(_walletBtnCanClick);
      walletAccountConfirmCtr.addListener(_walletBtnCanClick);
    } else {
      bankAccountCtr.addListener(_walletBtnCanClick);
      bankAccountConfirmCtr.addListener(_walletBtnCanClick);
    }
  }

  @override
  void onReady() {
    postAppConfigInfoRequest(AppConfigClickType.collectionType);
    super.onReady();
  }

  void clickWalletItemView(int index) {
    state.walletSelectIndex = index;
  }
  void disableWalletClickToast() {
    if (state.walletBtnDisableClick) {
      ProgressHUD.showInfo(
          'Please fill in all information completely——Por favor complete toda la información completamente');
    }
  }

  void disableBankClickToast() {
    if (state.bankBtnDisableClick) {
      ProgressHUD.showInfo(
          'Please fill in all information completely——Por favor complete toda la información completamente');
    }
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
        }else if(position==1){
           state.walletSelectIndex=0;
           walletAccountCtr.text='';
           walletAccountConfirmCtr.text='';
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
          state.originAccountList
            ..clear()
            ..addAll(netList);
          state.walletList.clear();
          for (int i = 0; i < state.originAccountList.length; i++) {
            var bean = state.originAccountList[i];
            var type = bean.humanExpensiveBraveryHarmfulPhoto ?? '';
            if (type != '1') {
              var key = bean.latestCandle ?? '';
              var value = bean.northernMarriageCommunism ?? '';
              var keyValueBean = KeyValueBean(key: key, value: value);
              state.walletList.add(keyValueBean);
            }
          }
        } else if (clickType == AppConfigClickType.bankNameList) {
          state.originBankNameList
            ..clear()
            ..addAll(netList);

          var showList = netList.map((e) => e.latestCandle).toList();
          if (!ObjectUtil.isEmptyList(showList)) {
            _showSelectDialog(showList, clickType);
          }
        } else if (clickType == AppConfigClickType.bankAccountType) {
          state.originBankTypeList
            ..clear()
            ..addAll(netList);
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

    ///钱包
    if (state.accountTypeSelectIndex == 0) {
      var walletName = state.walletList[state.walletSelectIndex].key ?? '';

      collectionType = _getWalletCollectionType(walletName);
      bankAccountNumber = walletAccountConfirmCtr.text.strRvSpace();
    } else if (state.accountTypeSelectIndex == 1) {
      ///银行卡
      collectionType = _getBankCollectionType();
      bankName = _getCode(state.originBankNameList, state.bankName);
      bankAccountType = _getCode(state.originBankTypeList, state.bankType);
      bankAccountNumber = bankAccountConfirmCtr.text.strRvSpace();
    }

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
      _bankBtnCanClick();
    }, selectData: selectData);
  }

  String _getWalletCollectionType(String key) {
    if (!ObjectUtil.isEmptyList(state.originAccountList)) {
      for (int i = 0; i < state.originAccountList.length; i++) {
        var bean = state.originAccountList[i];
        if (bean.latestCandle == key) {
          return bean.humanExpensiveBraveryHarmfulPhoto ?? '';
        }
      }
    }
    return '';
  }

  String _getBankCollectionType() {
    if (!ObjectUtil.isEmptyList(state.originAccountList)) {
      for (int i = 0; i < state.originAccountList.length; i++) {
        var bean = state.originAccountList[i];
        var type = bean.humanExpensiveBraveryHarmfulPhoto ?? '';
        if (type == '1') {
          return bean.humanExpensiveBraveryHarmfulPhoto ?? '';
        }
      }
    }
    return '';
  }

  String _getCode(List<ConfigInfoBean> dataSource, String value) {
    if (!ObjectUtil.isEmptyList(dataSource)) {
      for (int i = 0; i < dataSource.length; i++) {
        var bean = dataSource[i];
        if (bean.latestCandle == value) {
          return bean.humanExpensiveBraveryHarmfulPhoto ?? '';
        }
      }
    }
    return '';
  }

  void _walletBtnCanClick() {
    if (ObjectUtil.isEmptyString(walletAccountCtr.text.strRvSpace()) ||
        ObjectUtil.isEmptyString(walletAccountConfirmCtr.text.strRvSpace())) {
      state.walletBtnDisableClick = true;
    } else {
      state.walletBtnDisableClick = false;
    }
  }

  void _bankBtnCanClick() {
    if (ObjectUtil.isEmptyString(bankAccountCtr.text.strRvSpace()) ||
        ObjectUtil.isEmptyString(bankAccountConfirmCtr.text.strRvSpace()) ||
        ObjectUtil.isEmptyString(state.bankType) ||
        ObjectUtil.isEmptyString(state.bankName)) {
      state.bankBtnDisableClick = true;
    } else {
      state.bankBtnDisableClick = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    walletAccountCtr.dispose();
    walletAccountConfirmCtr.dispose();
    bankAccountConfirmCtr.dispose();
    bankAccountCtr.dispose();
  }
}