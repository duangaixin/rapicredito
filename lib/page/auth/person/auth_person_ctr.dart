import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_picker.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class AuthPersonCtr extends BaseGetCtr {
  final state = AuthPersonState();
  TextEditingController emailCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailCtr.addListener(_btnCanClick);
  }

  @override
  void onReady() {
    super.onReady();
    _postQueryAuthPersonRequest();
  }


  void _btnCanClick() {
    if (ObjectUtil.isEmptyString(state.income) ||
        ObjectUtil.isEmptyString(state.familyCount) ||
        ObjectUtil.isEmptyString(state.educationalLevel) ||
        ObjectUtil.isEmptyString(emailCtr.text) ||
        !GetUtils.isEmail(emailCtr.text)) {
      state.btnDisableClick = true;
    } else {
      state.btnDisableClick = false;
    }
  }

  void _showSelectDialog(List netList, PersonClickType clickType) {
    dynamic selectData;
    if (clickType == PersonClickType.incomeType) {
      selectData = state.income;
    } else if (clickType == PersonClickType.familyCount) {
      selectData = state.familyCount;
    } else if (clickType == PersonClickType.educationalLevel) {
      selectData = state.educationalLevel;
    }
    CustomPicker.showSinglePicker(Get.context!, data: netList,
        onConfirm: (data, p) {
      selectData = data;
      if (clickType == PersonClickType.incomeType) {
        state.income = data;
      } else if (clickType == PersonClickType.familyCount) {
        state.familyCount = data;
      } else if (clickType == PersonClickType.educationalLevel) {
        state.educationalLevel = data;
      }
      _btnCanClick();
    }, selectData: selectData);
  }

  void postAppConfigInfoRequest(PersonClickType clickType) async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var typeStr = '';
    if (clickType == PersonClickType.incomeType) {
      typeStr = 'incomeLevel';
    } else if (clickType == PersonClickType.familyCount) {
      typeStr = 'familySize';
    } else if (clickType == PersonClickType.educationalLevel) {
      typeStr = 'educational';
    }
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

  Map<String, dynamic> collectPersonParam() {
    Map<String, dynamic> param = {};
    param['mistakenBriefInvitation'] = state.income;
    param['sadBirdHopelessHobby'] = emailCtr.text.strRvSpace();
    param['necessarySeasonTechnicalHers'] = state.familyCount;
    param['thesePopCrossCountryside'] = state.educationalLevel;
    param.addAll(getCommonParam());
    return param;
  }

  void postSaveAuthPersonRequest() async {
    KeyboardUtils.unFocus();
    if (!_validate()) return;
    Map<String, dynamic> param = collectPersonParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSaveAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      Get.toNamed(PageRouterName.authContactPage);
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  void _postQueryAuthPersonRequest() async {
    Map<String, dynamic> param = getCommonParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postQueryAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var authInfoBean=response.data;

      ProgressHUD.showText('成功了');
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  bool _validate() {
    if (ObjectUtil.isEmptyString(state.income)) {
      return false;
    }
    if (ObjectUtil.isEmptyString(state.familyCount)) {
      return false;
    }
    if (ObjectUtil.isEmptyString(state.educationalLevel)) {
      return false;
    }
    if (!GetUtils.isEmail(emailCtr.text.strRvSpace())) {
      return false;
    }
    return true;
  }
}

enum PersonClickType {
  incomeType,
  familyCount,
  educationalLevel,
  relationOne,
  relationTwo,
  gender
}
