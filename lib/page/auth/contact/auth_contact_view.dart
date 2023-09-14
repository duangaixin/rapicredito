import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/auth/contact/auth_contact_ctr.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class AuthContactPage extends GetView<AuthContactCtr> {
  const AuthContactPage({Key? key}) : super(key: key);

  Widget get oneContactView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 19.0, left: 14.0),
            child: CommonSectionTitleView(
              title: 'Primera referencia personal',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return CustomSelectView(
                    editTitle: 'Relación',
                    hintText: 'Por favor elige',
                    editContent: controller.state.relationshipOne,
                    action: controller.clickRelationOne,
                  );
                }),
                CustomEditView(
                  controller: controller.phoneOneCtr,
                  editTitle: 'Número de celular',
                  hintText: 'Introducir texto',
                  keyboardType: TextInputType.number,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                CustomEditView(
                  controller: controller.nameOneCtr,
                  editTitle: 'Nombre',
                  hintText: 'Introducir texto',
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ],
      );

  Widget get twoContactView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 33.0, bottom: 8.0, left: 14.0),
            child: const CommonSectionTitleView(
              title: 'Segunda referencia personal',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return CustomSelectView(
                    editTitle: 'Relación',
                    hintText: 'Por favor elige',
                    editContent: controller.state.relationshipTwo,
                    action: controller.clickRelationTwo,
                  );
                }),
                CustomEditView(
                  controller: controller.phoneTwoCtr,
                  editTitle: 'Número de celular',
                  hintText: 'Introducir texto',
                  keyboardType: TextInputType.number,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                CustomEditView(
                  controller: controller.nameTwoCtr,
                  editTitle: 'Nombre',
                  hintText: 'Introducir texto',
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
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
                disableColors: const [
                  Color(0xffF5F6F4),
                  Color(0xffF5F6F4),
                ],
                disable: controller.state.btnDisableClick,
                realClick: controller.clickSubmit,
                disableClick: controller.disableClickToast,
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
                      fontWeight: FontWeight.bold),
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

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Contacto de emergencia',
        actions: [rightView],
        content: Obx(() {
          return LoadContainerView(
              contentView: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [oneContactView, twoContactView, bottomView],
                ),
              ),
              loadState: controller.state.loadState);
        }));
  }
}
