import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/custom_click_view.dart';

class CustomCameraPage extends StatefulWidget {
  const CustomCameraPage({
    Key? key,
  }) : super(key: key);

  @override
  CustomCameraPageState createState() => CustomCameraPageState();
}

class CustomCameraPageState extends State<CustomCameraPage> {
  late CameraController controller;
  late List<CameraDescription> cameraList;

  @override
  void initState() {
    super.initState();
    var param = Get.arguments;
    if (param is Map && !ObjectUtil.isEmptyMap(param)) {
      if (param.containsKey('cameraList')) {
        cameraList = param['cameraList'];
      }
    }
    initCameraCtr();
  }

  void initCameraCtr() {
    if (cameraList.isEmpty) return;
    controller = CameraController(
      cameraList[cameraList.length > 1 ? 1 : 0],
      ResolutionPreset.max,
    );
    try {
      controller.initialize().then((value) {
        if (mounted) {
          setState(() {});
        }
      });
    } on CameraException catch (e) {
      var permissionError = e.code.contains('Permission');
      if (permissionError) {
        return;
      }
    }
  }

  Widget get captureBtn => CustomClickView(
        onTap: takeCamera,
        child: Container(
          width: 64.0,
          height: 64.0,
          margin: const EdgeInsets.only(bottom: 40.0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 1.0, color: Colors.white)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CameraPreview(controller!),
                )),
            Positioned(
                top: 40.0,
                left: 20.0,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: Get.back,
                  child: const Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 16.0),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: captureBtn,
            )
          ],
        ),
      );
    }
  }

  void takeCamera() {
    if (!controller.value.isInitialized || controller.value.isTakingPicture) {
      return;
    }
    controller.takePicture().then((XFile? file) async {
      if (mounted) {
        if (file != null) {
          Get.back(result: file);
        }
      }
    }).catchError((error) {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
