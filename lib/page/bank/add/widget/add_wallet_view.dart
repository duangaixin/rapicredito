import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/bank/add/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_edit_view.dart';

class AddWalletView extends GetView<AddBankCtr> {
  const AddWalletView({Key? key}) : super(key: key);

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
              key: GlobalKey(),
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

  Widget get walletSelectView => Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          shrinkWrap: true,
          itemCount: controller.state.walletList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildWalletItemView(index);
          },
        );
      });

  Widget _buildWalletItemView(int index) {
    var bean = controller.state.walletList[index];
    var title = bean.key ?? '';
    return CustomClickView(
        onTap: () {
          controller.clickWalletItemView(index);
        },
        child: Column(
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
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F8ED),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14.0, color: Color(0xff333333)),
                    ),
                  ),
                  Positioned(
                      top: 34.0,
                      left: 0.0,
                      right: 0.0,
                      child: Obx(() {
                        return Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 44.0,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                                color:
                                    controller.state.walletSelectIndex == index
                                        ? const Color(0xffB8EF17)
                                        : const Color(0xffEBEBEB),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: RichText(
                                text: TextSpan(
                                    text: Strings.autoLineString(
                                        'Enlace de solicitud：'),
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xff333333)),
                                    children: <TextSpan>[
                                  TextSpan(
                                    text: 'Solicita un enlace',
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 15.0,
                                        color: Color(0xff333333)),
                                  ),
                                ])));
                      }))
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ));
  }
}
