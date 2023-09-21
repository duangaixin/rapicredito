import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/model/order_info_bean.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

///5
class OrderLoanFailedView extends GetView<MainOrderCtr> {
  final OrderInfoBean bean;

  const OrderLoanFailedView({Key? key, required this.bean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAppInfoView(),
          _buildErrorInfoView(),
          _buildBottomView(),
          _buildLineView()
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

  Widget _buildErrorInfoView() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              Resource.assetsImageOrderErrorInfo,
              imageType: ImageType.assets,
              width: 32.0,
              height: 32.0,
              margin: EdgeInsets.only(right: 7.0),
            ),
            Expanded(
                child: Text(
              'Su puntaje de crédito está por debajo de los requisitos mínimos para préstamos de plataforma.',
              style: TextStyle(fontSize: 14.0, color: Color(0xffD53535)),
            ))
          ],
        ));
  }

  Widget _buildBottomView() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 14.0),
      child: CustomButton(
        onPressed: () {},
        minWidth: 254.0,
        minHeight: 46.0,
        backgroundColor: const Color(0xffB8EF17),
        disabledBackgroundColor: const Color(0xffB8EF17),
        fontSize: 15.0,
        radius: 8.0,
        text: 'Actualizar cuenta receptora',
        textColor: const Color(0xff333333),
      ),
    );
  }
}
