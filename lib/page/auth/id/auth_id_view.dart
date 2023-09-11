import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';

class AuthIdPage extends GetView<AuthIdCtr> {
  const AuthIdPage({Key? key}) : super(key: key);

  Widget idCameraView(String title, String imageUrl, VoidCallback func) =>
      CustomClickView(
          onTap: func,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                key: GlobalKey(),
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
                return idCameraView('Frente', controller.state.idFrontUrl, () {
                  //controller.tackCamera(isFront: true);
                  controller.showSelectDialog(isFront: true);
                });
              })),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(child: Obx(() {
                return idCameraView('Atrás', controller.state.idBackUrl, () {
                  //  controller.tackCamera(isFront: false);
                  controller.showSelectDialog(isFront: false);
                });
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
              return CustomImageView(
                ObjectUtil.isEmptyString(controller.state.faceUrl)
                    ? Resource.assetsImageAuthCameraBg
                    : controller.state.faceUrl,
                imageType: ObjectUtil.isEmptyString(controller.state.faceUrl)
                    ? ImageType.assets
                    : ImageType.network,
                placeholder: Resource.assetsImageAuthCameraBg,
                memCacheHeight: 91,
                memCacheWidth: 167,
                width: 167.0,
                height: 91.0,
                radius: 8.0,
              );
            }),
            Positioned(
              top: 25.0,
              left: 63.0,
              right: 63.0,
              child: Obx(() {
                return Visibility(
                    visible: ObjectUtil.isEmptyString(controller.state.faceUrl),
                    child: const CustomImageView(
                      Resource.assetsImageAuthFace,
                      imageType: ImageType.assets,
                      width: 41.0,
                      height: 41.0,
                      fit: BoxFit.contain,
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
                ))
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
            child: faceCameraView(controller.goToCustomCamera),
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
                realClick: controller.postSaveAuthIdRequest,
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

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Información básica',
        actions: [rightView],
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [idCardView, faceView, infoView, bottomView],
          ),
        ));
  }

  Widget get rightView => CustomClickView(
        onTap: () {
          Get.toNamed(PageRouterName.clientPage, arguments: {
            AppConstants.fromPageNameKey: PageRouterName.clientPage
          });
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
}
