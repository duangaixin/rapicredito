import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
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

  Widget idCameraView(String title, VoidCallback func) => CustomClickView(
      onTap: func,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            Resource.assetsImageAuthTakeCamera,
            imageType: ImageType.assets,
            width: controller.state.imageWidth,
            height: 91.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
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
              Expanded(child: idCameraView('Frente', controller.tackCamera)),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(child: idCameraView('Atrás', controller.tackCamera)),
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
            CustomImageView(
              Resource.assetsImageAuthCameraBg,
              imageType: ImageType.assets,
              width: controller.state.imageWidth,
              height: 91.0,
              fit: BoxFit.contain,
            ),
            const Positioned(
              top: 25.0,
              left: 63.0,
              right: 63.0,
              child: CustomImageView(
                Resource.assetsImageAuthFace,
                imageType: ImageType.assets,
                width: 41.0,
                height: 41.0,
                fit: BoxFit.contain,
              ),
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
            child: CustomColorButton(
              disableColors: const [
                Color(0xffF5F6F4),
                Color(0xffF5F6F4),
              ],
              disable: false,
              colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
              height: 46.0,
              borderRadius: BorderRadius.circular(8.0),
              btnContent: const Text(
                'Registrarse',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
            ),
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
                  controller: TextEditingController(),
                  editTitle: 'Número de documento',
                  hintText: 'Introducir texto',
                ),
                CustomEditView(
                  controller: TextEditingController(),
                  editTitle: 'Nombres',
                  hintText: 'Introducir texto',
                ),
                CustomEditView(
                  controller: TextEditingController(),
                  editTitle: 'Apellidos',
                  hintText: 'Introducir texto',
                ),
                CustomSelectView(
                  editTitle: 'Género',
                  hintText: 'Por favor elige',
                  editContent: '',
                  action: () {},
                ),
                CustomSelectView(
                  editTitle: 'Fecha de nacimiento',
                  hintText: 'Por favor elige',
                  editContent: '',
                  action: () {},
                )
              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Información básica',
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [idCardView, faceView, infoView, bottomView],
          ),
        ));
  }
}
