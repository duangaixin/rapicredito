import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';

class AuthPersonPage extends GetView<AuthPersonCtr> {
  const AuthPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;
    return CustomPageBgView(
      resizeToAvoidBottomInset: false,
      title: 'Información básica',
      actions: [rightView],
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(
                              top: 18.0, left: 14.0, right: 16.0),
                          child: CommonSectionTitleView(
                            title: 'Información básica',
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() {
                              return CustomSelectView(
                                editTitle: 'Ingresos',
                                hintText: 'Por favor elige',
                                editContent: controller.state.income,
                                action: controller.clickIncome,
                              );
                            }),
                            CompositedTransformTarget(
                              link: controller.state.layerLink,
                              child: CustomEditView(
                                controller: controller.emailCtr,
                                focusNode: controller.emailFocusNode,
                                key: controller.state.emailKey,
                                editTitle: 'Dirección de correo electrónico',
                                hintText: 'Introducir texto',
                                keyboardType: TextInputType.emailAddress,
                                editStyle: const TextStyle(
                                    color: Color(0xffD53535), fontSize: 15.0),
                                inputFormatter: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(controller.state.regexNotNull),
                                  )
                                ],
                              ),
                            ),
                            Obx(() {
                              return CustomSelectView(
                                  editTitle: 'Tamaño de la familia',
                                  hintText: 'Por favor elige',
                                  editContent: controller.state.familyCount,
                                  action: controller.clickFamily);
                            }),
                            Obx(() {
                              return CustomSelectView(
                                  editTitle: 'Nivel de educación',
                                  hintText: 'Por favor elige',
                                  editContent:
                                      controller.state.educationalLevel,
                                  action: controller.clickEducational);
                            }),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 39.0, right: 39.0, top: 26.0),
                              child: Obx(() {
                                return CustomColorButton(
                                  disableClick: controller.disableClickToast,
                                  realClick: controller.clickSubmit,
                                  disableColors: const [
                                    Color(0xffF5F6F4),
                                    Color(0xffF5F6F4),
                                  ],
                                  disable: controller.state.btnDisableClick,
                                  colors: const [
                                    Color(0xffB8EF17),
                                    Color(0xffB8EF17)
                                  ],
                                  height: 46.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  btnContent: Text(
                                    'Siguiente',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: controller.state.btnDisableClick
                                          ? const Color(0xffC4BFBF)
                                          : const Color(0xff333333),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: CommonAuthAgreeView(),
          )
        ],
      ),
    );
  }

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
}
