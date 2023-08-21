import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
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
          if (result != null && result is XFile) {
            var file = File(result.path);
            var compressFile = await CompressUtil.compressImage(file, 1048576);
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
      var compressFile = await CompressUtil.compressImage(file, 1048576);
    }
  }
}
