import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/compress_util.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/utils/screen_util.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class AuthIdCtr extends BaseGetCtr {
  final state = AuthIdState();

  @override
  void onInit() {
    super.onInit();
    state.imageWidth = ScreenUtil.getScreenH(Get.context!) - 32 - 10 - 1;
  }

  void tackCamera({bool isFront = true}) {
    KeyboardUtils.unFocus();
    PermissionUtil.checkPermission(
        permissionList: [Permission.camera],
        onSuccess: () async {
          XFile? result =
              await ImagePicker().pickImage(source: ImageSource.camera);
          print(result?.path ?? '' + '-----duanxin===path');
          if (result != null) {
            var file = File(result.path);
            _uploadIdPhoto(file, isFront);
          }
        },
        onFailed: () {});
  }

  void _uploadIdPhoto(File file, bool isFront) async {
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
      'everydayMapleChallengingAirline': '00'
    });
    Get.showLoading();
    var response = await HttpRequestManage.instance.postUploadIdCard(formData);
    if (response.isSuccess()) {
      _postQueryPhotoInfo();
    } else {
      Get.dismiss();
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  Future<void> _postQueryPhotoInfo() async {
    var param = <String, dynamic>{};
    param.addAll(getCommonParam());
    var response = await HttpRequestManage.instance.postQueryPhotoInfo(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var photoBean = response.data;
      var frontUrl = photoBean?.tastelessAmericanPlateCattle ?? '';
      if (state.idBackUrl != frontUrl) {
        state.idBackUrl = frontUrl;
      }
      var backUrl = photoBean?.hugeNeed ?? '';
      if (state.idBackUrl != backUrl) {
        state.idBackUrl = backUrl;
      }
    } else {
      var errorMsg = response.message ?? 'error';
      ProgressHUD.showError(errorMsg);
    }
  }

  void goToCustomCamera() async {
    List<CameraDescription> cameraList = await availableCameras();
    var result = await Get.toNamed(PageRouterName.customCameraPage,
        arguments: {'cameraList': cameraList});
  }
}
