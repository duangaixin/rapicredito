import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/page/loan/widget/loan_date_select_view.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class LoanDatePage extends GetView<LoanDateCtr> {
  const LoanDatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Cantidad máxima',
        content: Obx(() {
          return LoadContainerView(
              contentView: contentView, loadState: controller.state.loadState);
        }));
  }

  Widget get contentView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoanDateTopView(),
                  centerView,
                  bottomView,
                ],
              ),
            ),
          )),
          submitBtn
        ],
      );

  Widget get centerView => Container(
        margin: const EdgeInsets.only(bottom: 20.0, top: 12.0),
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
                    content: '876.00',
                    fontSize: 15.0,
                    color: const Color(0xff333333),
                    fontWeight: FontWeight.bold)),
            _buildKeyValueView(
              title: 'Interés',
              content: '876.00',
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: _buildKeyValueView(
                    title: 'Cargo por servicios', content: '876.00')),
            _buildKeyValueView(
              title: 'IVA',
              content: '876.00',
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 11.0),
                child: _buildKeyValueView(
                  title:
                      'Cargo por servicios de transferencia\n(Cobrado por el Banco)',
                  content: '876.00',
                )),
            _buildKeyValueView(
                title: 'Monto del préstamo',
                content: '876.00',
                color: const Color(0xff333333),
                fontWeight: FontWeight.bold,
                fontSize: 15.0)
          ],
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
          maxLines: 1,
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

  Widget get bottomView => Container(
        padding: const EdgeInsets.only(
            left: 10.0, top: 20.0, right: 10.0, bottom: 22.0),
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Programa de reembolso',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 11.0, bottom: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Programa de reembolso',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
                  ),
                  Text(
                    '876.00',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fecha de pago de tu crédito',
                  style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
                ),
                Text(
                  '17-01-2021',
                  style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
                ),
              ],
            ),
          ],
        ),
      );

  Widget get submitBtn => Padding(
        padding: const EdgeInsets.only(
            bottom: 23.0, left: 55.0, right: 55.0, top: 26.0),
        child: CustomButton(
          onPressed: () {},
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
}
