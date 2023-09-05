import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/compress_util.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/utils/screen_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_picker.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class AuthIdCtr extends BaseGetCtr {
  final state = AuthIdState();
  TextEditingController idNumCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController secondNameCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    state.imageWidth = ScreenUtil.getScreenH(Get.context!) - 32 - 10 - 1;
    idNumCtr.addListener(_btnCanClick);
    firstNameCtr.addListener(_btnCanClick);
    secondNameCtr.addListener(_btnCanClick);
  }

  @override
  void onReady() {
    _requestInitData();
    super.onReady();
  }

  void _requestInitData() {
    Get.showLoading();
    Future.wait([
      _postQueryAuthPersonRequest(),
      _postQueryPhotoInfo(),
    ]).whenComplete(() {
      Get.dismiss();
    });
  }

  void showSelectDialog({bool isFront = true}) {
    CustomPicker.showSinglePicker(Get.context!,
        data: ['Tomar fotos', 'Seleccionar del álbum'], onConfirm: (data, p) {
      if (p == 0) {
        tackCamera(isFront: isFront);
      } else if (p == 1) {
        pickImage(isFront: isFront);
      }
    });
  }

  void pickImage({bool isFront = true}) async {
    KeyboardUtils.unFocus();
    PermissionUtil.checkPermission(
        permissionList: [Permission.camera],
        onSuccess: () async {
          XFile? result =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          print(result?.path ?? '' + '-----duanxin===path');
          if (result != null) {
            var file = File(result.path);
            _uploadPhotoData(file, isFront);
          }
        },
        onFailed: () {});
  }

  void tackCamera({bool isFront = true, bool isUploadFace = false}) {
    KeyboardUtils.unFocus();
    PermissionUtil.checkPermission(
        permissionList: [Permission.camera],
        onSuccess: () async {
          XFile? result =
              await ImagePicker().pickImage(source: ImageSource.camera);
          print(result?.path ?? '' + '-----duanxin===path');
          if (result != null) {
            var file = File(result.path);
            _uploadPhotoData(file, isFront, isUploadFace: isUploadFace);
          }
        },
        onFailed: () {});
  }

  void goToCustomCamera() async {
    List<CameraDescription> cameraList = await availableCameras();
    var result = await Get.toNamed(PageRouterName.customCameraPage,
        arguments: {'cameraList': cameraList});
    if (result != null && result is XFile) {
      var file = File(result.path);
      _uploadPhotoData(file, true, isUploadFace: true);
    }
  }

  void showDateDialog() {
    KeyboardUtils.unFocus();
    dynamic selectData;
    if (!ObjectUtil.isEmptyString(state.birth)) {
      selectData = PDuration(
          year: state.birthYear, month: state.birthMonth, day: state.birthDay);
    } else {
      selectData = PDuration(year: 2000, month: 1, day: 1);
    }
    CustomPicker.showDatePicker(Get.context!, onConfirm: (PDuration res) {
      state.birthDay = res.day;
      state.birthMonth = res.month;
      state.birthYear = res.year;
      state.birth = '${res.day}-${res.month}-${res.year}';
      _btnCanClick();
    }, selectDate: selectData);
  }

  void _showSelectDialog(List netList, AppConfigClickType clickType) {
    dynamic selectData;
    if (clickType == AppConfigClickType.gender) {
      selectData = state.gender;
    }
    CustomPicker.showSinglePicker(Get.context!, data: netList,
        onConfirm: (data, p) {
      selectData = data;
      if (clickType == AppConfigClickType.gender) {
        state.gender = data;
      }
      _btnCanClick();
    }, selectData: selectData);
  }

  void disableClickToast() {
    if (state.btnDisableClick) {
      ProgressHUD.showInfo(
          'Please fill in all information completely——Por favor complete toda la información completamente');
    }
  }

  void _btnCanClick() {
    if (ObjectUtil.isEmptyString(state.idFrontUrl) ||
        ObjectUtil.isEmptyString(state.idBackUrl) ||
        ObjectUtil.isEmptyString(state.faceUrl) ||
        ObjectUtil.isEmptyString(idNumCtr.text.strRvSpace()) ||
        ObjectUtil.isEmptyString(firstNameCtr.text.trim()) ||
        ObjectUtil.isEmptyString(secondNameCtr.text.trim()) ||
        ObjectUtil.isEmptyString(state.gender) ||
        ObjectUtil.isEmptyString(state.birth)) {
      state.btnDisableClick = true;
    } else {
      state.btnDisableClick = false;
    }
  }

  Map<String, dynamic> _collectIdParam() {
    Map<String, dynamic> param = {};
    //身份证号
    param['undividedMay'] = idNumCtr.text.strRvSpace();
    //姓
    param['puzzledConditionFamiliarUnion'] = firstNameCtr.text.trim();
    //名
    param['pacificCheapMineralCrazyLamb'] = secondNameCtr.text.trim();
    //性别
    param['fairJarExitPair'] = state.gender;
    //生日
    param['juicyGayPresentation'] = state.birth;
    param.addAll(getCommonParam());
    return param;
  }

  void clickGender() {
    if (ObjectUtil.isEmptyList(state.genderList)) {
      _postAppConfigInfoRequest(AppConfigClickType.gender);
    } else {
      _showSelectDialog(state.genderList, AppConfigClickType.gender);
    }
  }

  void _postAppConfigInfoRequest(AppConfigClickType clickType) async {
    KeyboardUtils.unFocus();
    var param = <String, dynamic>{};
    var typeStr = '';
    if (clickType == AppConfigClickType.gender) {
      typeStr = 'sex';
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
        if (clickType == AppConfigClickType.gender) {
          state.genderList
            ..clear()
            ..addAll(showList);
        }
        if (!ObjectUtil.isEmptyList(showList)) {
          _showSelectDialog(showList, clickType);
        }
      }
    } else {
      NetException.toastException(response);
    }
  }

  Future<void> _postQueryAuthPersonRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response =
        await HttpRequestManage.instance.postQueryAuthInfoRequest(param);
    if (response.isSuccess()) {
      var authInfoBean = response.data;
      idNumCtr.text = authInfoBean?.undividedMay ?? '';
      firstNameCtr.text = authInfoBean?.puzzledConditionFamiliarUnion ?? '';
      secondNameCtr.text = authInfoBean?.pacificCheapMineralCrazyLamb ?? '';
      state.gender = authInfoBean?.fairJarExitPair ?? '';
      state.birth = authInfoBean?.juicyGayPresentation ?? '';
      if (!ObjectUtil.isEmptyString(state.birth)) {
        List<String> birthList = state.birth.split('-');
        if (!ObjectUtil.isEmptyList(birthList) && birthList.length == 3) {
          state.birthYear = int.tryParse(birthList[2]);
          state.birthMonth = int.tryParse(birthList[1]);
          state.birthDay = int.tryParse(birthList[0]);
        }
      }
      _btnCanClick();
    } else {
      NetException.toastException(response);
    }
  }

  void postSaveAuthIdRequest() async {
    KeyboardUtils.unFocus();
    Map<String, dynamic> param = _collectIdParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postSaveAuthInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      Get.until((route) => route.settings.name == PageRouterName.mainPage);
    } else {
      NetException.toastException(response);
    }
  }

  void _uploadPhotoData(File file, bool isFront,
      {bool isUploadFace = false}) async {
    var compressFile = await CompressUtil.compressImage(file);
    final String path = compressFile.path;
    print('$path-----duanxin===compressFilePath');
    final String name = path.substring(path.lastIndexOf('/') + 1);
    MultipartFile multipartFile =
        await MultipartFile.fromFile(path, filename: name);
    var userId = StorageService.to.getInt(AppConstants.userIdKey);
    final FormData formData = FormData.fromMap({
      'medicalPrisonStationEnoughNobody': isFront ? multipartFile : '',
      'lovelyFrontBurialBiscuit': isFront ? '' : multipartFile,
      'madUnableBackacheCanal': '204',
      'terminalDifferentActionFatFountain': userId,
      'dailyFortuneQuantity': '0.0,0.0',
      'contraryScientificRightNone': 'es',
      'everydayMapleChallengingAirline': isUploadFace ? '01' : '00'
    });
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postUploadPhotoRequest(formData);
    Get.dismiss();
    if (response.isSuccess()) {
      Future.delayed(const Duration(milliseconds: 50), () {
        _postQueryPhotoInfo(isShowDialog: true);
      });
    } else {
      ProgressHUD.showError('Upload failed, please upload again-Carga fallida');
    }
  }

  Future<void> _postQueryPhotoInfo({bool isShowDialog = false}) async {
    var param = <String, dynamic>{};
    param.addAll(getCommonParam());
    if (isShowDialog) {
      Get.showLoading();
    }
    var response = await HttpRequestManage.instance.postQueryPhotoInfo(param);
    if (isShowDialog) {
      Get.dismiss();
    }
    if (response.isSuccess()) {
      var photoBean = response.data;
      var frontUrl = photoBean?.tastelessAmericanPlateCattle ?? '';
      if (state.idFrontUrl != frontUrl) {
        state.idFrontUrl = frontUrl;
      }
      var backUrl = photoBean?.hugeNeed ?? '';
      if (state.idBackUrl != backUrl) {
        state.idBackUrl = backUrl;
      }
      var faceUrl = photoBean?.dueReligionFoggyCustom ?? '';
      if (state.faceUrl != faceUrl) {
        state.faceUrl = faceUrl;
      }
      _btnCanClick();
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  @override
  void dispose() {
    super.dispose();
    idNumCtr.removeListener(_btnCanClick);
    firstNameCtr.removeListener(_btnCanClick);
    secondNameCtr.removeListener(_btnCanClick);
    idNumCtr.dispose();
    firstNameCtr.dispose();
    secondNameCtr.dispose();
  }
}
