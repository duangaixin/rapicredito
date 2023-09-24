import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/model/order_info_bean.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class OrderRepaymentView extends GetView<MainOrderCtr> {
  final OrderInfoBean bean;

  const OrderRepaymentView({Key? key, required this.bean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAppInfoView(),
          _buildShowInfoView(),
          _buildBottomView(),
          _buildLineView()
        ],
      ),
    );
  }

  Widget _buildShowInfoView() {
    var payAmount = bean.interestingComradeHairIntroduction ?? 0.0;
    var payAmountStr = '\$${Strings.formatPrice(payAmount.toString())}';
    var payDate = bean.disabledBusyEngine ?? '';
    return Container(
      margin: const EdgeInsets.only(top: 13.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffF5F6F4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKeyValueView('Monto del préstamo', payAmountStr),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _buildKeyValueView('Fecha de aplicación', payDate),
          )
        ],
      ),
    );
  }

  Widget _buildAppInfoView() {
    var logoUrl = bean.bornDoubleShallowAcheActiveSparrow ?? '';
    var appName = bean.unfitImpressionSingleHandSuchElectricity ?? '';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImageView(
          logoUrl,
          placeholder: Resource.assetsImageAuthCameraBg,
          width: 44.0,
          height: 44.0,
          memCacheWidth: 44,
          memCacheHeight: 44,
          radius: 8.0,
          margin: const EdgeInsets.only(right: 10.0),
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appName,
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text(
                  'Devolución pendiente',
                  style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                ))
          ],
        )
      ],
    );
  }

  Widget _buildLineView() {
    return Container(
      height: 1.0,
      color: const Color(0xffE8E8E8),
      width: double.infinity,
    );
  }

  Widget _buildKeyValueView(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xff333333),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15.0,
            color: Color(0xff333333),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomView() {
    var delayDay = bean.passiveHis ?? 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 7.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () {},
            minWidth: 177.5,
            minHeight: 46.0,
            backgroundColor: Colors.white,
            disabledBackgroundColor: Colors.white,
            fontSize: 15.0,
            radius: 8.0,
            text: 'Prolonga $delayDay días más',
            textAlign: TextAlign.center,
            textColor: const Color(0xff333333),
            side: const BorderSide(color: Color(0xff333333), width: 1.0),
          )),
          const SizedBox(
            width: 13.0,
          ),
          CustomButton(
              onPressed: () {},
              minWidth: 145.0,
              minHeight: 46.0,
              backgroundColor: const Color(0xffB8EF17),
              disabledBackgroundColor: const Color(0xffB8EF17),
              fontSize: 15.0,
              radius: 8.0,
              text: 'Pagar',
              textColor: const Color(0xff444444))
        ],
      ),
    );
  }
}
