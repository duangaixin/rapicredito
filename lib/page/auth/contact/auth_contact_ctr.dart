import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/page/auth/contact/auth_contact_state.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/dialog/go_setting_dialog.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_picker.dart';
import 'package:rapicredito/widget/load_container_view.dart';
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
    super.onReady();
    _requestInitData();
  }

  void _requestInitData() async {
    await _postAppConfigInfoRequest(AppConfigClickType.relationOne);
    await _postQueryAuthPersonRequest();
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

  void _showSelectDialog(List netList, AppConfigClickType clickType) {
    KeyboardUtils.unFocus();
    dynamic selectData;
    if (clickType == AppConfigClickType.relationOne) {
      selectData = state.relationshipOne;
    } else if (clickType == AppConfigClickType.relationTwo) {
      selectData = state.relationshipTwo;
    }
    CustomPicker.showSinglePicker(Get.context!, data: netList,
        onConfirm: (data, p) {
      selectData = data;
      if (clickType == AppConfigClickType.relationOne) {
        state.relationshipOne = data;
      } else if (clickType == AppConfigClickType.relationTwo) {
        state.relationshipTwo = data;
      }
      _btnCanClick();
    }, selectData: selectData);
  }

  void disableClickToast() {
    if (state.btnDisableClick) {
      ProgressHUD.showInfo(
          'Por favor complete toda la información completamente');
    }
  }

  Map<String, dynamic> _collectContactParam() {
    Map<String, dynamic> param = {};
    param['rainyMonthDiscount'] =
        _getCode(state.relationshipOriginList, state.relationshipOne);
    param['pureDollFailure'] = phoneOneCtr.text.strRvSpace();
    param['communistBuddhistZooExtraCellar'] = nameOneCtr.text.trim();
    param['instantMerchantMidday'] =
        _getCode(state.relationshipOriginList, state.relationshipTwo);
    param['theoreticalAppleFlatLateFriendship'] = phoneTwoCtr.text.strRvSpace();
    param['quickNonDetermination'] = nameTwoCtr.text.trim();
    param.addAll(getCommonParam());
    return param;
  }

  void clickRelationOne() {
    if (ObjectUtil.isEmptyList(state.relationshipShowList)) {
      _postAppConfigInfoRequest(AppConfigClickType.relationOne);
    } else {
      _showSelectDialog(
          state.relationshipShowList, AppConfigClickType.relationOne);
    }
  }

  void clickRelationTwo() {
    if (ObjectUtil.isEmptyList(state.relationshipShowList)) {
      _postAppConfigInfoRequest(AppConfigClickType.relationTwo);
    } else {
      _showSelectDialog(
          state.relationshipShowList, AppConfigClickType.relationTwo);
    }
  }

  Future<void> _postAppConfigInfoRequest(AppConfigClickType clickType) async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var typeStr = '';
    if (clickType == AppConfigClickType.relationTwo ||
        clickType == AppConfigClickType.relationOne) {
      typeStr = 'relationship';
    }
    param['everydayMapleChallengingAirline'] = typeStr;
    param.addAll(getCommonParam());
    var response = await HttpRequestManage.instance.postAppConfigInfo(param);
    if (response.isSuccess()) {
      var netList = response.data ?? [];
      if (!ObjectUtil.isEmptyList(netList)) {
        state.relationshipOriginList
          ..clear()
          ..addAll(netList);
        var showList = netList.map((e) => e.latestCandle).toList();
        state.relationshipShowList
          ..clear()
          ..addAll(showList);
      }
    } else {
      NetException.dealAllException(response);
    }
  }

  Future<void> _postQueryAuthPersonRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response =
        await HttpRequestManage.instance.postQueryAuthInfoRequest(param);
    if (response.isSuccess()) {
      var authInfoBean = response.data;
      state.relationshipOne = _getName(
          state.relationshipOriginList, authInfoBean?.rainyMonthDiscount ?? '');
      phoneOneCtr.text = authInfoBean?.pureDollFailure ?? '';
      nameOneCtr.text = authInfoBean?.communistBuddhistZooExtraCellar ?? '';
      state.relationshipTwo = _getName(state.relationshipOriginList,
          authInfoBean?.instantMerchantMidday ?? '');
      phoneTwoCtr.text = authInfoBean?.theoreticalAppleFlatLateFriendship ?? '';
      nameTwoCtr.text = authInfoBean?.quickNonDetermination ?? '';
      _btnCanClick();
      state.loadState = LoadState.succeed;
    } else {
      state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  void clickSubmit() async {
    Get.showLoading();
    await postSaveAuthContactRequest();
    var appMainCtr = Get.find<AppMainCtr>();
    var status = await appMainCtr.postQueryIsNeedUploadJsonRequest();
    Get.dismiss();
    if (status == '0') {
      PermissionUtil.checkPermission(
          permissionList: [
            Permission.camera,
            Permission.sms,
            Permission.calendar,
            Permission.phone,
          ],
          onSuccess: () async {
            Get.showLoading();
            await appMainCtr.postUploadJsonRequest();
            Get.dismiss();
            Get.toNamed(PageRouterName.authIdPage);
          },
          goSetting: () {
            showGoSettingDialog();
          });
    } else {
      Get.toNamed(PageRouterName.authIdPage);
    }
  }

  void showGoSettingDialog() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return GoSettingDialog(
            clickConfirm: () {
              openAppSettings();
            },
          );
        });
  }

  Future<void> postSaveAuthContactRequest() async {
    KeyboardUtils.unFocus();
    if (!_validate()) return;
    Map<String, dynamic> param = _collectContactParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSaveAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
     //  Get.toNamed(PageRouterName.authIdPage);
    } else {
      NetException.dealAllException(response);
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

  String _getName(List<ConfigInfoBean> dataSource, String value) {
    if (!ObjectUtil.isEmptyList(dataSource)) {
      for (int i = 0; i < dataSource.length; i++) {
        var bean = dataSource[i];
        if (bean.humanExpensiveBraveryHarmfulPhoto == value) {
          return bean.latestCandle ?? '';
        }
      }
    }
    return '';
  }

  @override
  void onClose() {
    super.onClose();
    phoneOneCtr.removeListener(_btnCanClick);
    nameOneCtr.removeListener(_btnCanClick);
    phoneTwoCtr.removeListener(_btnCanClick);
    nameTwoCtr.removeListener(_btnCanClick);
    phoneOneCtr.dispose();
    nameOneCtr.dispose();
    phoneTwoCtr.dispose();
    nameTwoCtr.dispose();
  }
}
