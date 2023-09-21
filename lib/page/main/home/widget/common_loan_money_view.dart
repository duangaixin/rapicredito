import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/resources.dart';
import 'package:rapicredito/utils/text_util.dart';

class CommonLoanMoneyView extends GetView<MainHomeCtr> {
  const CommonLoanMoneyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 190.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(Resource.assetsImageHomeInfoBg),
              fit: BoxFit.cover)),
      margin: const EdgeInsets.only(top: 20.0, left: 47.0, right: 47.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 24.0, bottom: 10.0),
              child: Text(
                'Monto del préstamo',
                style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
              )),
          Obx(() {
            var loanMoney = '';
            var str = controller
                .dealEndZero(controller.mainHomeState.creditAmount.toString());
            if (int.tryParse(str) != null) {
              loanMoney = str;
            } else {
              loanMoney = (double.tryParse(str) ?? 0.0).toString();
            }
            if (controller.mainHomeState.overdueStatus == 0 ||
                controller.mainHomeState.overdueStatus == 1) {
              var str = controller.dealEndZero(
                  controller.mainHomeState.repaymentAmount.toString());
              if (int.tryParse(str) != null) {
                loanMoney = str;
              } else {
                loanMoney = (double.tryParse(str) ?? 0.0).toString();
              }
            }

            return Text(
              '${loanMoney}GTQ',
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            );
          }),
          Container(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 12.0, left: 30.0, right: 30),
            child: const HomeDashLine(
              color: Color(0xffE2E5DA),
            ),
          ),
          const Text(
            'Fecha de aplicación',
            style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 11.0),
              child: Obx(() {
                var dateStr = controller.mainHomeState.applyDate;
                var overdueStatus = controller.mainHomeState.overdueStatus;
                if (overdueStatus == 0 || overdueStatus == 1) {
                  dateStr = controller.mainHomeState.repaymentDate;
                }
                return Text(
                  dateStr,
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                );
              })),
        ],
      ),
    );
  }
}

class HomeDashLine extends StatelessWidget {
  final double height;
  final Color color;

  final double dashWidth;

  const HomeDashLine(
      {super.key,
      this.height = 1,
      this.color = Colors.black,
      this.dashWidth = 10.0});

  @override
  Widget build(BuildContext context) {
    final boxWidth = Get.size.width - 84 - 60;
    final dashHeight = height;
    final dashCount = (boxWidth / (2 * dashWidth)).floor();

    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: List.generate(dashCount, (_) {
        return SizedBox(
          width: dashWidth,
          height: dashHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}
