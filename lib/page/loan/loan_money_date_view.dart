import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/page/loan/widget/loan_date_select_view.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/style/resources.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class LoanMoneyDatePage extends GetView<LoanMoneyDateCtr> {
  const LoanMoneyDatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Cantidad máxima',
        actions: [rightView],
        content: Obx(() {
          return LoadContainerView(
              contentView: contentView, loadState: controller.state.loadState);
        }));
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

  Widget get submitView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          submitBtn,
          const CommonAgreeView(),
        ],
      );

  Widget get contentView => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LoanDateTopView(),
            centerView,
            bottomView,
            submitView
          ],
        ),
      );

  Widget get centerView => Container(
        margin: const EdgeInsets.only(
            bottom: 20.0, top: 12.0, left: 16.0, right: 16.0),
        padding: const EdgeInsets.only(
            left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Desembolsar&Tarifa',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                child: _buildKeyValueView(
                    title: 'Cantidad a recibir',
                    content: controller.state.amountInHand,
                    fontSize: 15.0,
                    color: const Color(0xff333333),
                    fontWeight: FontWeight.bold)),
            _buildKeyValueView(
              title: 'Interés',
              content: controller.state.interest,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: _buildKeyValueView(
                    title: 'Cargo por servicios',
                    content: controller.state.serviceCharge)),
            _buildKeyValueView(
              title: 'IVA',
              content: controller.state.iva,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 11.0),
                child: _buildKeyValueView(
                  title:
                      'Cargo por servicios de transferencia\n(Cobrado por el Banco)',
                  content: controller.state.bankServiceCharge,
                )),
            Obx(() {
              return _buildKeyValueView(
                  title: 'Monto del préstamo',
                  content: Strings.addEndZero(
                      controller.state.applyAmount.toString()),
                  color: const Color(0xff333333),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0);
            })
          ],
        ),
      );

  Widget get bottomView => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.only(
            left: 10.0, top: 20.0, right: 10.0, bottom: 22.0),
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Programa de reembolso',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11.0, bottom: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Monto de devolución',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
                  ),
                  Text(
                    controller.state.repaymentAmount,
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xff666666)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Fecha de pago de tu crédito',
                  style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
                ),
                Obx(() {
                  return Text(
                    controller.state.repaymentDate,
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xff666666)),
                  );
                }),
              ],
            ),
          ],
        ),
      );

  Widget get submitBtn => Padding(
        padding: const EdgeInsets.only(
            bottom: 20.0, left: 55.0, right: 55.0, top: 20.0),
        child: CustomButton(
          onPressed: controller.clickSubmitBtn,
          minWidth: 265.0,
          minHeight: 46.0,
          backgroundColor: const Color(0xffB8EF17),
          disabledBackgroundColor: const Color(0xffB8EF17),
          fontSize: 15.0,
          radius: 8.0,
          text: 'Aplicar préstamo',
          textColor: const Color(0xff333333),
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildKeyValueView(
      {String title = '',
      String content = '',
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 14.0,
      Color? color}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: fontSize,
              color: color ?? const Color(0xff666666),
              fontWeight: fontWeight),
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: fontSize,
              color: color ?? const Color(0xff666666),
              fontWeight: fontWeight),
        ),
      ],
    );
  }
}
