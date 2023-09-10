import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/model/order_info_bean.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

///审核中1
class OrderUnderReviewView extends GetView<MainOrderCtr> {
  final OrderInfoBean bean;

  const OrderUnderReviewView({
    Key? key,
    required this.bean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [_buildAppInfoView(), _buildShowInfoView(), _buildLineView()],
      ),
    );
  }

  Widget _buildShowInfoView() {
    var applyAmount = bean.funnyAustraliaTeamTale ?? 0.0;
    var submitTime = bean.luckyExperience ?? '';
    return Container(
      margin: const EdgeInsets.only(top: 13.0, bottom: 14.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffF5F6F4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKeyValueView('Monto del préstamo', applyAmount.toString()),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _buildKeyValueView('Fecha de aplicación', submitTime),
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
          radius: 8.0,
          margin: const EdgeInsets.only(right: 10.0),
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'APPName',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  appName,
                  style:
                      const TextStyle(fontSize: 14.0, color: Color(0xff333333)),
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
}
