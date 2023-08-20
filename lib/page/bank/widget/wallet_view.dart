import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/bank/index.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';

class WalletView extends GetView<SelectBankCtr> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return walletView;
  }

  Widget get walletView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          walletSelectView,
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: CustomEditView(
              controller: TextEditingController(),
              editTitle: 'Cuenta de billetera móvil',
              hintText: 'Introducir texto',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: CustomEditView(
              controller: TextEditingController(),
              editTitle: 'Confirmar Cuenta de  billetera móvil',
              hintText: 'Introducir texto',
            ),
          ),
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
                'Confirmar',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );

  Widget get walletSelectView => ListView.builder(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        shrinkWrap: true,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildWalletItemView(index);
        },
      );

  Widget _buildWalletItemView(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 78.0,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 146.0,
                height: 44.0,
                decoration: BoxDecoration(
                    color: const Color(0xffF5F8ED),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Positioned(
                  top: 34.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      width: double.infinity,
                      height: 44.0,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffB8EF17),
                          borderRadius: BorderRadius.circular(10.0))))
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
