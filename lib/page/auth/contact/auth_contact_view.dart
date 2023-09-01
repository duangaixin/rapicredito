import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/contact/auth_contact_ctr.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
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
                    action:controller.clickRelationOne,
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
                    action:controller.clickRelationTwo,
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
                realClick: controller.postSaveAuthContactRequest,
                disableClick: controller.disableClickToast,
                colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
                height: 46.0,
                borderRadius: BorderRadius.circular(8.0),
                btnContent:  Text(
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

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Contacto de emergencia',
        content:  Obx(() {
          return LoadContainerView(
              contentView:  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [oneContactView, twoContactView, bottomView],
                ),
              ), loadState: controller.state.loadState);
        })

       );
//  double bottom = MediaQuery.of(context).viewInsets.bottom;
    // return CustomPageBgView(
    //     title: 'Contacto de emergencia',
    //     content: Container(
    //       padding: const EdgeInsets.only(left: 14.0, right: 16.0, top: 18.0),
    //       child: Stack(
    //         children: [
    //           Positioned(
    //             child: SingleChildScrollView(
    //               physics: BouncingScrollPhysics(),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisSize: MainAxisSize.max,
    //                 children: [
    //                   const CommonAuthTitleView(
    //                     title: 'Primera referencia personal',
    //                   ),
    //                   CustomSelectView(
    //                     editTitle: 'Relación',
    //                     hintText: 'Por favor elige',
    //                     editContent: '',
    //                     action: () {},
    //                   ),
    //                   CustomEditView(
    //                     controller: TextEditingController(),
    //                     editTitle: 'Número de celular',
    //                     hintText: 'Introducir texto',
    //                   ),
    //                   CustomEditView(
    //                     controller: TextEditingController(),
    //                     editTitle: 'Nombre',
    //                     hintText: 'Introducir texto',
    //                   ),
    //                   SizedBox(
    //                     height: 33.0,
    //                   ),
    //                   const CommonAuthTitleView(
    //                     title: 'Segunda referencia personal',
    //                   ),
    //                   CustomSelectView(
    //                     editTitle: 'Relación',
    //                     hintText: 'Por favor elige',
    //                     editContent: '',
    //                     action: () {},
    //                   ),
    //                   CustomEditView(
    //                     controller: TextEditingController(),
    //                     editTitle: 'Número de celular',
    //                     hintText: 'Introducir texto',
    //                   ),
    //                   CustomEditView(
    //                     controller: TextEditingController(),
    //                     editTitle: 'Nombre',
    //                     hintText: 'Introducir texto',
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             bottom: bottom > 0 ? 5.0 : 120,
    //             left: 0.0,
    //             right: 0.0,
    //             top: 0.0,
    //           ),
    //           Positioned(
    //             child: CommonAuthAgreeView(),
    //             bottom: bottom > 0 ? -115.0 : 20.0,
    //             left: 0.0,
    //             right: 0.0,
    //           )
    //         ],
    //       ),
    //     ));
  }
}
