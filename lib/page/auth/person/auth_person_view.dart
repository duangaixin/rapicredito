import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/auth/widget/comon_auth_title_view.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';

class AuthPersonPage extends GetView<AuthPersonCtr> {
  const AuthPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
      titleSpace: 14.0,
      resizeToAvoidBottomInset: false,
      title: 'Información básica',
      content: Container(
          padding: const EdgeInsets.only(left: 14.0, right: 16.0, top: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonAuthTitleView(
                            title: 'Información básica',
                          ),
                          Obx(() {
                            return CustomSelectView(
                              editTitle: 'Ingresos',
                              hintText: 'Por favor elige',
                              editContent: controller.state.income,
                              action: () {},
                            );
                          }),
                          CustomEditView(
                            controller: TextEditingController(),
                            editTitle: 'Dirección de correo electrónico',
                            hintText: '',
                          ),
                          Obx(() {
                            return CustomSelectView(
                              editTitle: 'Tamaño de la familia',
                              hintText: 'Por favor elige',
                              editContent: controller.state.familyCount,
                              action: () {},
                            );
                          }),
                          Obx(() {
                            return CustomSelectView(
                              editTitle: 'Nivel de educación',
                              hintText: 'Por favor elige',
                              editContent: controller.state.educationalLevel,
                              action: () {},
                            );
                          }),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 39.0, right: 39.0, top: 26.0),
                            child: Obx(() {
                              return CustomColorButton(
                                disableColors: const [
                                  Color(0xffF5F6F4),
                                  Color(0xffF5F6F4),
                                ],
                                disable: controller.state.btnCanClick,
                                colors: const [
                                  Color(0xffB8EF17),
                                  Color(0xffB8EF17)
                                ],
                                height: 46.0,
                                borderRadius: BorderRadius.circular(8.0),
                                btnContent: const Text(
                                  'Siguiente',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xffC4BFBF)),
                                ),
                              );
                            }),
                          )
                        ],
                      ))),
              bottomView
            ],
          )),
    );
  }

  Widget get bottomView => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                Resource.assetsImageMainOne,
                imageType: ImageType.assets,
                width: 18.0,
                height: 15.0,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  Strings.autoLineString(
                      'Todos los datos que rellene serán tratados correctamente y nunca revelarán su información personal.'),
                  style: TextStyle(fontSize: 13.0, color: Color(0xff666666)),
                ),
              ))
            ],
          ),
          CommonAgreeView()
        ],
      );
}
