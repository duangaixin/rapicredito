import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/account/index.dart';
import 'package:rapicredito/page/auth/person/auth_person_ctr.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';
import 'package:rapicredito/widget/custom_select_view.dart';

class BankView extends GetView<AccountCtr> {
  const BankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bankView;
  }

  Widget get bankView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(
                left: 28.0, right: 16.0, top: 15.0, bottom: 12.0),
            child: Text(
              'Por favor, asegúrese de tener una cuenta bancaria',
              style: TextStyle(fontSize: 13.0, color: Color(0xffD53535)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Obx(() {
              return CustomSelectView(
                editTitle: 'Nombre del banco',
                hintText: 'Por favor elige',
                editContent: controller.state.bankName,
                action: controller.clickBankName,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Obx(() {
              return CustomSelectView(
                editTitle: 'Tipo de cuenta bancaria',
                hintText: 'Por favor elige',
                editContent: controller.state.bankType,
                action: controller.clickBankType,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: CustomEditView(
              key: GlobalKey(),
              maxLength: 16,
              keyboardType: TextInputType.number,
              controller: controller.bankAccountCtr,
              editTitle: 'Numero de cuenta',
              hintText: 'Introducir texto',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: CustomEditView(
              key: GlobalKey(),
              maxLength: 16,
              keyboardType: TextInputType.number,
              controller: controller.bankAccountConfirmCtr,
              editTitle: 'Confirmar Numero de cuenta',
              hintText: 'Introducir texto',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 26.0),
            child: Obx(() {
              return CustomColorButton(
                realClick: controller.postSaveAccountRequest,
                disableClick: controller.disableBankClickToast,
                disableColors: const [
                  Color(0xffF5F6F4),
                  Color(0xffF5F6F4),
                ],
                disable: controller.state.bankBtnDisableClick,
                colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
                height: 46.0,
                borderRadius: BorderRadius.circular(8.0),
                btnContent: Text(
                  'Registrarse',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: controller.state.bankBtnDisableClick
                          ? const Color(0xffC4BFBF)
                          : const Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
              );
            }),
          ),
        ],
      );
}
