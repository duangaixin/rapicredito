import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/home/widget/common_loan_money_view.dart';
import 'package:rapicredito/utils/string_ext.dart';

class HomeLoanAuditView extends GetView<MainHomeCtr> {
  const HomeLoanAuditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const MainAppBarView(
                    title: 'Bajo Revisión',
                  ),
                  const CommonLoanMoneyView(),
                  auditTipView,
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: CommonAgreeView(),
                  )
                ],
              ),
            )),
      );
    });
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
