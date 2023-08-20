import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/contact/auth_contact_ctr.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/page/auth/widget/comon_auth_title_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';

class AuthContactPage extends GetView<AuthContactCtr> {
  const AuthContactPage({Key? key}) : super(key: key);

  Widget get oneContactView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CommonAuthTitleView(
            title: 'Primera referencia personal',
          ),
          Obx(() {
            return CustomSelectView(
              editTitle: 'Relación',
              hintText: 'Por favor elige',
              editContent: controller.state.relationshipOne,
              action: () {},
            );
          }),
          CustomEditView(
            controller: TextEditingController(),
            editTitle: 'Número de celular',
            hintText: 'Introducir texto',
          ),
          CustomEditView(
            controller: TextEditingController(),
            editTitle: 'Nombre',
            hintText: 'Introducir texto',
          ),
        ],
      );

  Widget get twoContactView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 33.0, bottom: 8.0),
            child: const CommonAuthTitleView(
              title: 'Segunda referencia personal',
            ),
          ),
          Obx(() {
            return CustomSelectView(
              editTitle: 'Relación',
              hintText: 'Por favor elige',
              editContent: controller.state.relationshipTwo,
              action: () {},
            );
          }),
          CustomEditView(
            controller: TextEditingController(),
            editTitle: 'Número de celular',
            hintText: 'Introducir texto',
          ),
          CustomEditView(
            controller: TextEditingController(),
            editTitle: 'Nombre',
            hintText: 'Introducir texto',
          ),
        ],
      );

  Widget get bottomView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 39.0, right: 39.0, top: 26.0),
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

  @override
  Widget build(BuildContext context) {
    //  double bottom = MediaQuery.of(context).viewInsets.bottom;
    return CustomPageBgView(
        title: 'Contacto de emergencia',
        content: Container(
            padding: const EdgeInsets.only(left: 14.0, right: 16.0, top: 18.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [oneContactView, twoContactView, bottomView],
              ),
            )));

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
