import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/style/resources.dart';


class CommonLoanMoneyView extends StatefulWidget {
  const CommonLoanMoneyView({
    Key? key,
  }) : super(key: key);

  @override
  CommonLoanMoneyViewState createState() => CommonLoanMoneyViewState();
}

class CommonLoanMoneyViewState extends State<CommonLoanMoneyView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(Resource.assetsImageAuthCameraBg),
              fit: BoxFit.cover)),
      margin: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0),
            child: Text(
              '300,702GTQ',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 12.0,left: 30.0,right: 30),
            child: const HomeDashLine(
              color: Color(0xffE2E5DA),
            ),
          ),
          const Text(
            'Fecha de aplicación',
            style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 11.0),
              child: Text(
                '30-11-2021',
                style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
              )),
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
    final boxWidth = Get.size.width-84-60;
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
