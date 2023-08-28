import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';

class AuthPersonPage extends GetView<AuthPersonCtr> {
  const AuthPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
      resizeToAvoidBottomInset: false,
      title: 'Información básica',
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
                                action: () {
                                  controller.postAppConfigInfoRequest(
                                      PersonClickType.incomeType);
                                },
                              );
                            }),
                            CustomEditView(
                              controller: controller.emailCtr,
                              editTitle: 'Dirección de correo electrónico',
                              hintText: 'Por ejemplo:12345678@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              hintStyle: const TextStyle(
                                  color: Color(0xffD53535), fontSize: 15.0),
                            ),
                            Obx(() {
                              return CustomSelectView(
                                editTitle: 'Tamaño de la familia',
                                hintText: 'Por favor elige',
                                editContent: controller.state.familyCount,
                                action: () {
                                  controller.postAppConfigInfoRequest(
                                      PersonClickType.familyCount);
                                },
                              );
                            }),
                            Obx(() {
                              return CustomSelectView(
                                editTitle: 'Nivel de educación',
                                hintText: 'Por favor elige',
                                editContent: controller.state.educationalLevel,
                                action: () {
                                  controller.postAppConfigInfoRequest(
                                      PersonClickType.educationalLevel);
                                },
                              );
                            }),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 39.0, right: 39.0, top: 26.0),
                              child: Obx(() {
                                return CustomColorButton(
                                  disableClick: controller.disableClickToast,
                                  realClick: controller.goToNextPage,
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
}
