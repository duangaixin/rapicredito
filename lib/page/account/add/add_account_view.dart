import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/account/add/widget/add_bank_view.dart';
import 'package:rapicredito/page/account/add/widget/add_wallet_view.dart';
import 'package:rapicredito/page/auth/widget/common_auth_agreement_view.dart';
import 'package:rapicredito/page/account/add/index.dart';
import 'package:rapicredito/widget/comon_section_title_view.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';

class AddAccountPage extends GetView<AddAccountCtr> {
  const AddAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Método de pago',
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              selectView,

              Obx(() {
                return Visibility(
                    visible: controller.state.accountTypeSelectIndex == 0,
                    child: const AddWalletView());
              }),
              Obx(() {
                return Visibility(
                    visible: controller.state.accountTypeSelectIndex == 1,
                    child: const AddBankView());
              }),

              const Padding(
                padding: EdgeInsets.only(bottom: 30.0,top: 30.0),
                child: CommonAuthAgreeView(),
              )
            ],
          ),
        ));
  }

  Widget get tipView => const Visibility(
      visible: true,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: Text(
          'Por favor, rellene la información correcta de cobro para asegurarse de que el préstamo se puede conceder sin problemas a su cuenta.',
          style: TextStyle(fontSize: 15.0, color: Color(0xffD53535)),
        ),
      ));

  Widget get selectView => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 32.0, left: 14.0),
            child: CommonSectionTitleView(
              title: 'Método de pago',
            ),
          ),
          selectTypeView
        ],
      );

  Widget get selectTypeView => Container(
        color: const Color(0xffF5F8ED),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 8.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Método de pago',
              style: TextStyle(fontSize: 16.0, color: Color(0xff333333)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 7.0),
              child: CustomClickView(
                  onTap: controller.showSelectBankDialog,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Obx(() {
                        return Text(
                          controller
                              .state.accountTypeList[controller.state.accountTypeSelectIndex],
                          style: const TextStyle(
                              fontSize: 15.0, color: Color(0xff333333)),
                        );
                      })),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xff6a6a6a),
                        size: 17,
                      )
                    ],
                  )),
            ),
            Container(height: 1.0, color: const Color(0xffDCE2CC))
          ],
        ),
      );
}
