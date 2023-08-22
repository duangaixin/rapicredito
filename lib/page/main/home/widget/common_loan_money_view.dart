import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/style/resources.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_dash_line.dart';
import 'package:timelines/timelines.dart';

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
   var dashLineWith= Get.size.width-94.0-50.0;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(Resource.assetsImageAuthCameraBg),
              fit: BoxFit.cover)),
      margin: const EdgeInsets.only(top: 20.0, left: 47.0, right: 47.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 24.0, bottom: 10.0),
              child: Text(
                'Monto del préstamo',
                style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
              )),
          Text(
            '300,702GTQ',
            style: TextStyle(
                fontSize: 30.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 12.0),
            child: CustomDashLine(
              color: Color(0xffE2E5DA),
              width: 100.0 ,
            ),
          ),
          Text(
            'Fecha de aplicación',
            style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 11.0),
              child: Text(
                'Monto del préstamo',
                style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
              )),
        ],
      ),
    );
  }
}
