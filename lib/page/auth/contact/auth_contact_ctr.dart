import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/page/auth/contact/auth_contact_state.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_picker.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class AuthContactCtr extends BaseGetCtr {
  final state = AuthContactState();
  TextEditingController phoneOneCtr = TextEditingController();
  TextEditingController nameOneCtr = TextEditingController();
  TextEditingController phoneTwoCtr = TextEditingController();
  TextEditingController nameTwoCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    phoneOneCtr.addListener(_btnCanClick);
    nameOneCtr.addListener(_btnCanClick);
    phoneTwoCtr.addListener(_btnCanClick);
    nameTwoCtr.addListener(_btnCanClick);
  }

  @override
  void onReady() {
    _postQueryAuthPersonRequest();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    phoneOneCtr.dispose();
    nameOneCtr.dispose();
    phoneTwoCtr.dispose();
    nameTwoCtr.dispose();
  }

  void _btnCanClick() {
    if (ObjectUtil.isEmptyString(state.relationshipOne) ||
        ObjectUtil.isEmptyString(phoneOneCtr.text.strRvSpace()) ||
        ObjectUtil.isEmptyString(nameOneCtr.text.trim()) ||
        ObjectUtil.isEmptyString(state.relationshipTwo) ||
        ObjectUtil.isEmptyString(phoneTwoCtr.text.strRvSpace()) ||
        ObjectUtil.isEmptyString(nameTwoCtr.text.trim())) {
      state.btnDisableClick = true;
    } else {
      state.btnDisableClick = false;
    }
  }

  void _showSelectDialog(List netList, PersonClickType clickType) {
    dynamic selectData;
    if (clickType == PersonClickType.relationOne) {
      selectData = state.relationshipOne;
    } else if (clickType == PersonClickType.relationTwo) {
      selectData = state.relationshipTwo;
    }
    CustomPicker.showSinglePicker(Get.context!, data: netList,
        onConfirm: (data, p) {
      selectData = data;
      if (clickType == PersonClickType.relationOne) {
        state.relationshipOne = data;
      } else if (clickType == PersonClickType.relationTwo) {
        state.relationshipTwo = data;
      }
      _btnCanClick();
    }, selectData: selectData);
  }

  void postAppConfigInfoRequest(PersonClickType clickType) async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var typeStr = 'relationship';
    param['everydayMapleChallengingAirline'] = typeStr;
    param.addAll(getCommonParam());
    Get.showLoading();
    var response = await HttpRequestManage.instance.postAppConfigInfo(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var netList = response.data ?? [];
      if (!ObjectUtil.isEmptyList(netList)) {
        var showList = netList.map((e) => e.latestCandle).toList();
        if (!ObjectUtil.isEmptyList(showList)) {
          _showSelectDialog(showList, clickType);
        }
      }
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  void disableClickToast() {
    if (state.btnDisableClick) {
      ProgressHUD.showInfo(
          'Please fill in all information completely——Por favor complete toda la información completamente');
    }
  }

  Map<String, dynamic> collectContactParam() {
    Map<String, dynamic> param = {};
    param['rainyMonthDiscount'] = state.relationshipOne;
    param['pureDollFailure'] = phoneOneCtr.text.strRvSpace();
    param['communistBuddhistZooExtraCellar'] = nameOneCtr.text.trim();
    param['instantMerchantMidday'] = state.relationshipOne;
    param['theoreticalAppleFlatLateFriendship'] = phoneTwoCtr.text.strRvSpace();
    param['quickNonDetermination'] = nameTwoCtr.text.trim();
    param.addAll(getCommonParam());
    return param;
  }

  void _postQueryAuthPersonRequest() async {
    Map<String, dynamic> param = getCommonParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postQueryAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var authInfoBean = response.data;

      ProgressHUD.showText('成功了');
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  void postSaveAuthContactRequest() async {
    KeyboardUtils.unFocus();
    if (!_validate()) return;
    Map<String, dynamic> param = collectContactParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSaveAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      Get.toNamed(PageRouterName.authIdPage);
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  bool _validate() {
    if (ObjectUtil.isEmptyString(state.relationshipOne)) {
      return false;
    }
    if (ObjectUtil.isEmptyString(phoneOneCtr.text.strRvSpace())) {
      return false;
    }
    if (ObjectUtil.isEmptyString(nameOneCtr.text.trim())) {
      return false;
    }
    if (ObjectUtil.isEmptyString(state.relationshipTwo)) {
      return false;
    }
    if (ObjectUtil.isEmptyString(phoneTwoCtr.text.strRvSpace())) {
      return false;
    }
    if (ObjectUtil.isEmptyString(nameTwoCtr.text.trim())) {
      return false;
    }
    return true;
  }
}
