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
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/compress_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/utils/screen_util.dart';

class AuthIdCtr extends BaseGetCtr {
  final state = AuthPersonState();

  @override
  void onInit() {
    super.onInit();
    state.imageWidth = ScreenUtil.getScreenH(Get.context!) - 32 - 10 - 1;
  }

  void tackCamera() {
    PermissionUtil.checkPermission(
        permissionList: [Permission.camera],
        onSuccess: () async {
          XFile? result =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (result != null) {
            var file = File(result.path);
            print(result.path+'-----duanxin===path');
            var compressFile = await CompressUtil.compressImage(file);
            final String path = compressFile.path;
            print(path+'-----duanxin===compressFilePath');
            final String name = path.substring(path.lastIndexOf('/') + 1);
            MultipartFile multipartFile = await MultipartFile.fromFile(path, filename: name);
            var userId = StorageService.to.getInt(AppConstants.userIdKey);
            final FormData formData = FormData.fromMap({
              'medicalPrisonStationEnoughNobody': multipartFile,
              'lovelyFrontBurialBiscuit':'',
              'madUnableBackacheCanal': '204',
              'terminalDifferentActionFatFountain': userId,
              'dailyFortuneQuantity': '0.0,0.0',
              'contraryScientificRightNone': 'es',
              'everydayMapleChallengingAirline':'00'
            });
            Get.showLoading();
           var response = await HttpRequestManage.instance.postUploadIdCard(formData);
            Get.dismiss();

          }
        },
        onFailed: () {});
  }

  void goToCustomCamera() async {
    List<CameraDescription> cameraList = await availableCameras();
    var result = await Get.toNamed(PageRouterName.customCameraPage,
        arguments: {'cameraList': cameraList});
  }
}
