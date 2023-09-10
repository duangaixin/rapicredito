import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/home/widget/common_loan_money_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_three_way_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_two_way_view.dart';
import 'package:rapicredito/utils/string_ext.dart';

///还款中
class HomeLoanMakingRepaymentView extends GetView<MainHomeCtr> {
  const HomeLoanMakingRepaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        MainAppBarView(
          title: 'Devolución pendiente',
        ),
        CommonLoanMoneyView(),
        SizedBox(
          height: 20.0,
        ),
        CommonPayTwoWayView(),
        SizedBox(
          height: 19.0,
        ),
        CommonPayThreeWayView()
      ],
    ));
  }

  Widget get auditTipView => Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 29.0),
      padding: const EdgeInsets.only(
          left: 23.0, right: 22.0, top: 16.0, bottom: 15.0),
      decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        Strings.autoLineString(
            'Estamos estimando su préstamo, Preste atención a los resultados de la revisión en la solicitud.'),
        style: const TextStyle(
          fontSize: 14.0,
          color: Color(0xff666666),
        ),
      ));
}
