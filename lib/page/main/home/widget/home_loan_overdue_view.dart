import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/home/widget/common_loan_money_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_three_way_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_two_way_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

///逾期中
class HomeLoanOverdueView extends GetView<MainHomeCtr> {
  const HomeLoanOverdueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(() {
              return MainAppBarView(
                title: 'Atrasado ${controller.mainHomeState.overdueDay} Días',
              );
            }),
            const CommonLoanMoneyView(),
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
              child: const CommonPayTwoWayView(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 19.0),
              child: const CommonPayThreeWayView(),
            ),
            overdueBtnView,
            overdueInfoView,
            moneyInfoView
          ],
        ));
  }

  Widget get overdueInfoView => Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        padding: const EdgeInsets.only(
            top: 18.0, left: 18.0, right: 17.0, bottom: 20.0),
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  Resource.assetsImageHomeLoanOverdue,
                  imageType: ImageType.assets,
                  width: 27.0,
                  height: 27.0,
                  margin: EdgeInsets.only(right: 10.0),
                ),
                Text(
                  'Advertir',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(
                top: 13.0,
              ),
              child: Obx(() {
                return RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: Strings.autoLineString(
                            'Su pedido se ha sido vencido por '),
                        style: const TextStyle(
                            fontSize: 15.0, color: Color(0xff333333)),
                        children: <TextSpan>[
                          TextSpan(
                              text: Strings.autoLineString(
                                  '${controller.mainHomeState.overdueDay} días,'),
                              style: const TextStyle(
                                  fontSize: 15.0, color: Color(0xffD53535))),
                          TextSpan(
                              text: Strings.autoLineString(
                                  'devuélvalo de inmediato. Si hay una situación de vencimiento maliciosa, ¡presentaremos una demanda en su contra a través de los canales legales!'),
                              style: const TextStyle(
                                  fontSize: 15.0, color: Color(0xff333333)))
                        ]));
              }),
            )
          ],
        ),
      );

  Widget get overdueBtnView => Obx(() {
        return Visibility(
            visible: controller.mainHomeState.canRolloverPay,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0, bottom: 25.0),
              child: Obx(() {
                return CustomButton(
                  onPressed: controller.clickRolloverBtn,
                  minWidth: 152.0,
                  minHeight: 46.0,
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.white,
                  fontSize: 15.0,
                  radius: 8.0,
                  text:
                      'Prórroga de pago\nde ${controller.mainHomeState.rolloverPayDay} días',
                  textAlign: TextAlign.center,
                  textColor: const Color(0xff333333),
                  fontWeight: FontWeight.bold,
                  side: const BorderSide(color: Color(0xff333333), width: 1.0),
                );
              }),
            ));
      });

  Widget get moneyInfoView => Container(
        margin: const EdgeInsets.only(
            top: 20.0, left: 16.0, right: 16.0, bottom: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 13.0, left: 18.0, right: 15.0, bottom: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Detalles',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Obx(() {
                    return _buildKeyValueView(
                        'Monto de devolución',
                        controller.addEndZero(controller
                            .mainHomeState.repaymentAmount
                            .toString()));
                  }),
                  Obx(() {
                    return _buildKeyValueView('Fecha de pago de tu crédito',
                        controller.mainHomeState.repaymentDate);
                  }),
                  Obx(() {
                    return _buildKeyValueView(
                        'Monto del préstamo',
                        controller.addEndZero(
                            controller.mainHomeState.creditAmount.toString()));
                  }),
                  Obx(() {
                    return _buildKeyValueView(
                        'Interés',
                        controller.addEndZero(
                            controller.mainHomeState.interest.toString()));
                  }),
                  Obx(() {
                    return _buildKeyValueView('Cargo por demora',
                        controller.addEndZero( controller.mainHomeState.overduePayment.toString()));
                  }),
                  Obx(() {
                    return _buildKeyValueView(
                        'Costo de deducción',
                        controller.addEndZero(
                            controller.mainHomeState.deductCost.toString()));
                  })
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildKeyValueView(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color(0xff666666),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color(0xff666666),
            ),
          ),
        ],
      ),
    );
  }
}
