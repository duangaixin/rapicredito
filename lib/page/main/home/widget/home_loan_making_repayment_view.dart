import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/home/widget/common_loan_money_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_three_way_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_two_way_view.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';

class HomeLoanMakingRepaymentView extends GetView<MainHomeCtr> {
  const HomeLoanMakingRepaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const MainAppBarView(
              title: 'Devolución pendiente',
            ),
            const CommonLoanMoneyView(),
            const SizedBox(
              height: 20.0,
            ),
            Obx(() {
              return Visibility(
                visible: controller.mainHomeState.onePayShow ||
                    controller.mainHomeState.twoPayShow,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
                  child: const CommonPayTwoWayView(),
                ),
              );
            }),
            Obx(() {
              return Visibility(
                visible: controller.mainHomeState.threePayShow ||
                    controller.mainHomeState.fourPayShow ||
                    controller.mainHomeState.fivePayShow,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 19.0),
                  child: const CommonPayThreeWayView(),
                ),
              );
            }),
            moneyInfoView
          ],
        ));
  }

  Widget get overdueBtnView => Obx(() {
        return Visibility(
          visible: controller.mainHomeState.canRolloverPay,
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
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
              })),
        );
      });

  Widget get moneyInfoView => Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            overdueBtnView,
            Container(
              margin: const EdgeInsets.only(top: 19.0),
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
                        Strings.addEndZero(controller
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
                        Strings.addEndZero(
                            controller.mainHomeState.creditAmount.toString()));
                  }),
                  Obx(() {
                    return _buildKeyValueView(
                        'Interés',
                        Strings.addEndZero(
                            controller.mainHomeState.interest.toString()));
                  }),
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
