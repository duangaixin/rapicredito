import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomePaymentResultDialog extends StatefulWidget {
  final String? date;

  const HomePaymentResultDialog({Key? key, this.date}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePaymentResultDialogState();
}

class _HomePaymentResultDialogState extends State<HomePaymentResultDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomImageView(
              Resource.assetsImageResultTip,
              imageType: ImageType.assets,
              width: 103.0,
              height: 87.0,
              margin: EdgeInsets.only(top: 122.0),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0),
              child: Text(
                '¡Has pagado con éxito!',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff666666),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 68.0),
              child: CustomButton(
                onPressed: () {
                  var mainHomeCtr = Get.find<MainHomeCtr>();
                  mainHomeCtr.requestInitData();
                  Get.back();
                },
                minWidth: 265.0,
                minHeight: 46.0,
                backgroundColor: const Color(0xffB8EF17),
                disabledBackgroundColor: const Color(0xffB8EF17),
                fontSize: 15.0,
                radius: 8.0,
                text: 'Préstamo de nuevo',
                textColor: const Color(0xff333333),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
