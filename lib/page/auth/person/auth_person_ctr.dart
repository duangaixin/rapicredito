import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/auth/person/widget/email_select_list_view.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/location_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_picker.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class AuthPersonCtr extends BaseGetCtr {
  final state = AuthPersonState();
  TextEditingController emailCtr = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  OverlayEntry? overlayEntry;
  BuildContext? buildContext;

  @override
  void onInit() {
    super.onInit();
    emailCtr.addListener(_btnCanClick);
    emailCtr.addListener(_emailEndListener);
    _requestLocation();
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

  void _emailEndListener() {
    if (!ObjectUtil.isEmptyString(emailCtr.text) &&
        emailFocusNode.hasFocus &&
        emailCtr.text.endsWith('@')) {
      showOverlay();
    } else {
      dismissOverlay();
    }
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
        ObjectUtil.isEmptyString(emailCtr.text.trim())) {
      state.btnDisableClick = true;
    } else {
      state.btnDisableClick = false;
    }
  }

  void _showSelectDialog(List netList, AppConfigClickType clickType) {
    KeyboardUtils.unFocus();
    dynamic selectData;
    if (clickType == AppConfigClickType.incomeType) {
      selectData = state.income;
    } else if (clickType == AppConfigClickType.familyCount) {
      selectData = state.familyCount;
    } else if (clickType == AppConfigClickType.educationalLevel) {
      selectData = state.educationalLevel;
    }
    CustomPicker.showSinglePicker(Get.context!, data: netList,
        onConfirm: (data, p) {
      selectData = data;
      if (clickType == AppConfigClickType.incomeType) {
        state.income = data;
      } else if (clickType == AppConfigClickType.familyCount) {
        state.familyCount = data;
      } else if (clickType == AppConfigClickType.educationalLevel) {
        state.educationalLevel = data;
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

  Map<String, dynamic> _collectPersonParam() {
    Map<String, dynamic> param = {};
    param['mistakenBriefInvitation'] = state.income;
    param['sadBirdHopelessHobby'] = emailCtr.text.strRvSpace();
    param['necessarySeasonTechnicalHers'] = state.familyCount;
    param['thesePopCrossCountryside'] = state.educationalLevel;
    param.addAll(getCommonParam());
    return param;
  }

  void clickSubmit() async {
    await postSaveAuthPersonRequest();
  }

  Future<void> setCrispInfo(String userEmail) async {
    MethodChannel channel = const MethodChannel('originInfoPlugin');
    var param = <String, String>{};
    param['userEmail'] = userEmail;
    await channel.invokeMethod('setCrispInfo', param);
  }

  Future<void> postSaveAuthPersonRequest() async {
    KeyboardUtils.unFocus();
    if (!_validate()) return;
    Get.showLoading();
    Map<String, dynamic> param = _collectPersonParam();
    var response =
        await HttpRequestManage.instance.postSaveAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var userEmail = emailCtr.text.strRvSpace();
      await StorageService.to.setString(AppConstants.userEmailKey, userEmail);
      await setCrispInfo(userEmail);
      Get.toNamed(PageRouterName.authContactPage);
    } else {
      NetException.dealAllException(response);
    }
  }

  void _postQueryAuthPersonRequest() async {
    Map<String, dynamic> param = getCommonParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postQueryAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var authInfoBean = response.data;
      state.income = authInfoBean?.mistakenBriefInvitation ?? '';
      emailCtr.text = authInfoBean?.sadBirdHopelessHobby ?? '';
      state.familyCount = authInfoBean?.necessarySeasonTechnicalHers ?? '';
      state.educationalLevel = authInfoBean?.thesePopCrossCountryside ?? '';
      _btnCanClick();
    } else {
      NetException.dealAllException(response);
    }
  }

  void clickIncome() {
    if (ObjectUtil.isEmptyList(state.incomeList)) {
      _postAppConfigInfoRequest(AppConfigClickType.incomeType);
    } else {
      _showSelectDialog(state.incomeList, AppConfigClickType.incomeType);
    }
  }

  void clickFamily() {
    if (ObjectUtil.isEmptyList(state.familyList)) {
      _postAppConfigInfoRequest(AppConfigClickType.familyCount);
    } else {
      _showSelectDialog(state.familyList, AppConfigClickType.familyCount);
    }
  }

  void goToClientPage() {
    KeyboardUtils.unFocus();
    if (UserStore.to.hasToken) {
      MethodChannel channel = const MethodChannel('originInfoPlugin');
      channel.invokeMethod('openChatActivity');
    } else {
      Get.toNamed(PageRouterName.clientPage,
          arguments: {AppConstants.fromPageNameKey: PageRouterName.clientPage});
    }
  }

  void clickEducational() {
    if (ObjectUtil.isEmptyList(state.educationalList)) {
      _postAppConfigInfoRequest(AppConfigClickType.educationalLevel);
    } else {
      _showSelectDialog(
          state.educationalList, AppConfigClickType.educationalLevel);
    }
  }

  void _postAppConfigInfoRequest(AppConfigClickType clickType) async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var typeStr = '';
    if (clickType == AppConfigClickType.incomeType) {
      typeStr = 'incomeLevel';
    } else if (clickType == AppConfigClickType.familyCount) {
      typeStr = 'familySize';
    } else if (clickType == AppConfigClickType.educationalLevel) {
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
        if (clickType == AppConfigClickType.incomeType) {
          state.incomeList
            ..clear()
            ..addAll(showList);
        } else if (clickType == AppConfigClickType.familyCount) {
          state.familyList
            ..clear()
            ..addAll(showList);
        } else if (clickType == AppConfigClickType.educationalLevel) {
          state.educationalList
            ..clear()
            ..addAll(showList);
        }
        if (!ObjectUtil.isEmptyList(showList)) {
          _showSelectDialog(showList, clickType);
        }
      }
    } else {
      NetException.dealAllException(response);
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

  @override
  void onClose() {
    dismissOverlay();
    emailCtr.removeListener(_emailEndListener);
    emailCtr.removeListener(_btnCanClick);
    emailFocusNode.dispose();
    emailCtr.dispose();
    super.onClose();
  }

  void showOverlay() {
    if (overlayEntry == null) {
      overlayEntry = overlay;
      if (overlayEntry != null) {
        Overlay.of(buildContext!).insert(overlayEntry!);
      }
    }
  }

  void dismissOverlay() {
    if (overlayEntry != null) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

  OverlayEntry get overlay => OverlayEntry(builder: (ctx) {
        final renderBox =
            state.emailKey.currentContext?.findRenderObject() as RenderBox;
        final size = renderBox.size;
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: state.layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height + 8),
            child: const EmailSelectListView(),
          ),
        );
      });
}

enum AppConfigClickType {
  incomeType,
  familyCount,
  educationalLevel,
  relationOne,
  relationTwo,
  gender,
  bankNameList,
  bankAccountType,
  collectionType,
  moneyDateType,
}
