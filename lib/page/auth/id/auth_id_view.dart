import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class AuthIdPage extends GetView<AuthIdCtr> {
  const AuthIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Información básica',
        actions: [rightView],
        content: Obx(() {
          return LoadContainerView(
              contentView: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [idCardView, faceView, infoView, bottomView],
                ),
              ),
              loadState: controller.state.loadState);
        }));
  }

  Widget idCameraView(Key key, String title, String imageUrl, VoidCallback func,
          bool isSuccess, String localPath) =>
      CustomClickView(
          onTap: func,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Visibility(
                      key: UniqueKey(),
                      visible: !ObjectUtil.isEmptyString(localPath),
                      child: CustomImageView(
                        key: key,
                        localPath,
                        imageType: ImageType.localFile,
                        memCacheWidth: controller.state.imageWidth.toInt(),
                        memCacheHeight: 91,
                        width: controller.state.imageWidth,
                        placeholder: Resource.assetsImageAuthTakeCamera,
                        height: 91.0,
                        radius: 8.0,
                        fit: BoxFit.fill,
                      )),
                  Visibility(
                      visible: ObjectUtil.isEmptyString(localPath),
                      child: CustomImageView(
                        key: key,
                        ObjectUtil.isEmptyString(imageUrl)
                            ? Resource.assetsImageAuthTakeCamera
                            : imageUrl,
                        imageType: ObjectUtil.isEmptyString(imageUrl)
                            ? ImageType.assets
                            : ImageType.network,
                        memCacheWidth: controller.state.imageWidth.toInt(),
                        memCacheHeight: 91,
                        width: controller.state.imageWidth,
                        placeholder: Resource.assetsImageAuthTakeCamera,
                        height: 91.0,
                        radius: 8.0,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                      bottom: 5.0,
                      right: 5.0,
                      child: Visibility(
                          visible: !ObjectUtil.isEmptyString(imageUrl) ||
                              !ObjectUtil.isEmptyString(localPath),
                          child: uploadTipView(isSuccess)))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0),
                child: Text(
                  title,
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ),
              )
            ],
          ));

  Widget get idCardView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14.0, top: 19.0),
            child: CommonSectionTitleView(
              title: 'ID CARD',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 16.0, right: 16.0),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(child: Obx(() {
                return idCameraView(controller.state.frontKey, 'Frente',
                    controller.state.idFrontUrl, () {
                  controller.showSelectDialog(isFront: true);
                }, controller.state.uploadFrontSuccess,
                    controller.state.idFrontPath);
              })),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(child: Obx(() {
                return idCameraView(controller.state.behindKey, 'Atrás',
                    controller.state.idBackUrl, () {
                  controller.showSelectDialog(isFront: false);
                }, controller.state.uploadBehindSuccess,
                    controller.state.idBackPath);
              })),
            ]),
          )
        ],
      );

  Widget faceCameraView(VoidCallback func) => CustomClickView(
      onTap: func,
      child: SizedBox(
        height: 108,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() {
              return Visibility(
                  key: UniqueKey(),
                  visible: !ObjectUtil.isEmptyString(controller.state.facePath),
                  child: CustomImageView(
                    key: key,
                    controller.state.facePath,
                    imageType: ImageType.localFile,
                    memCacheWidth: controller.state.imageWidth.toInt(),
                    memCacheHeight: 91,
                    width: 167.0,
                    placeholder: Resource.assetsImageAuthTakeCamera,
                    height: 91.0,
                    radius: 8.0,
                    fit: BoxFit.fill,
                  ));
            }),
            Obx(() {
              return Visibility(
                  key: UniqueKey(),
                  visible: ObjectUtil.isEmptyString(controller.state.facePath),
                  child: CustomImageView(
                    ObjectUtil.isEmptyString(controller.state.faceUrl)
                        ? Resource.assetsImageAuthCameraBg
                        : controller.state.faceUrl,
                    key: controller.state.faceKey,
                    imageType:
                        ObjectUtil.isEmptyString(controller.state.faceUrl)
                            ? ImageType.assets
                            : ImageType.network,
                    placeholder: Resource.assetsImageAuthCameraBg,
                    memCacheHeight: 91,
                    memCacheWidth: 167,
                    width: 167.0,
                    height: 91.0,
                    radius: 8.0,
                  ));
            }),
            Positioned(
              top: 25.0,
              left: 63.0,
              right: 63.0,
              child: Obx(() {
                return Visibility(
                    visible:
                        ObjectUtil.isEmptyString(controller.state.faceUrl) &&
                            ObjectUtil.isEmptyString(controller.state.facePath),
                    child: const CustomImageView(
                      Resource.assetsImageAuthFace,
                      imageType: ImageType.assets,
                      width: 41.0,
                      height: 41.0,
                      fit: BoxFit.fill,
                    ));
              }),
            ),
            Positioned(
                top: 81.0,
                child: Container(
                  alignment: Alignment.center,
                  height: 26.0,
                  width: 116.0,
                  decoration: BoxDecoration(
                      color: const Color(0xffB8EF17),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: const Text(
                    'Haga clic en',
                    style: TextStyle(fontSize: 15.0, color: Color(0Xff333333)),
                  ),
                )),
            Positioned(
                bottom: 22.0,
                right: 5.0,
                child: Obx(() {
                  return Visibility(
                      visible: !ObjectUtil.isEmptyString(controller.state.faceUrl) ||
                          !ObjectUtil.isEmptyString(controller.state.facePath),
                      child:     Container(
                        alignment: Alignment.center,
                        width: 18.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                            color: controller.state.uploadFaceSuccess
                                ? Colors.greenAccent
                                : Colors.red,
                            shape: BoxShape.circle),
                        child: Icon(
                          controller.state.uploadFaceSuccess
                              ? Icons.done
                              : Icons.close,
                          size: 12.0,
                          color: Colors.white,
                        ),
                      )

                  )



                ;
                }))
          ],
        ),
      ));

  Widget get faceView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 28.0, left: 14.0, bottom: 13.0),
            child: CommonSectionTitleView(
              title: 'Reconocimiento facial',
            ),
          ),
          Center(
            child: faceCameraView(() {
              controller.tackCamera(isUploadFace: true);
            }),
          )
        ],
      );

  Widget get bottomView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 26.0),
            child: Obx(() {
              return CustomColorButton(
                disableClick: controller.disableClickToast,
                realClick: controller.clickSubmitBtn,
                disableColors: const [
                  Color(0xffF5F6F4),
                  Color(0xffF5F6F4),
                ],
                disable: controller.state.btnDisableClick,
                colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
                height: 46.0,
                borderRadius: BorderRadius.circular(8.0),
                btnContent: Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: controller.state.btnDisableClick
                        ? const Color(0xffC4BFBF)
                        : const Color(0xff333333),
                  ),
                ),
              );
            }),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: CommonAuthAgreeView(),
          )
        ],
      );

  Widget get infoView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 33.0, bottom: 12.0, left: 14.0),
            child: CommonSectionTitleView(
              title: 'Tarjeta de identificación',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomEditView(
                  controller: controller.idNumCtr,
                  editTitle: 'Número de documento',
                  hintText: 'Introducir texto',
                  maxLength: 20,
                ),
                CustomEditView(
                  controller: controller.firstNameCtr,
                  editTitle: 'Nombres',
                  hintText: 'Introducir texto',
                ),
                CustomEditView(
                  controller: controller.secondNameCtr,
                  editTitle: 'Apellidos',
                  hintText: 'Introducir texto',
                ),
                Obx(() {
                  return CustomSelectView(
                      editTitle: 'Género',
                      hintText: 'Por favor elige',
                      editContent: controller.state.gender,
                      action: controller.clickGender);
                }),
                Obx(() {
                  return CustomSelectView(
                    editTitle: 'Fecha de nacimiento',
                    hintText: 'Por favor elige',
                    editContent: controller.state.birth,
                    action: controller.showDateDialog,
                  );
                }),
              ],
            ),
          )
        ],
      );

  Widget get rightView => CustomClickView(
        onTap: () {
          controller.goToClientPage();
        },
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 16.0, left: 5.0),
            child: const CustomImageView(
              Resource.assetsImageHomeTitleAction,
              imageType: ImageType.assets,
              width: 17.81,
              height: 19.0,
            )),
      );

  Widget uploadTipView(bool showSuccess) => Container(
        alignment: Alignment.center,
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(
            color: showSuccess ? Colors.greenAccent : Colors.red,
            shape: BoxShape.circle),
        child: Icon(
          showSuccess ? Icons.done : Icons.close,
          size: 12.0,
          color: Colors.white,
        ),
      );
}
