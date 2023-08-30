import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/result/rollover/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class RolloverPaymentResultPage extends GetView<RolloverPaymentResultCtr> {
  const RolloverPaymentResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
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
                  'Su última fecha de cambio es el  ',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff666666),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  '12-03-2022',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff666666),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 44.0, bottom: 4.0),
                child:  CustomButton(
                  onPressed: Get.back,
                  minWidth: 265.0,
                  minHeight: 46.0,
                  backgroundColor: const Color(0xffB8EF17),
                  disabledBackgroundColor: const Color(0xffB8EF17),
                  fontSize: 15.0,
                  radius: 8.0,
                  text: 'OK',
                  textColor: const Color(0xff333333),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(() {
                var time = controller.state.timeEnd;
                return Text(
                  '$time s',
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff666666),
                      fontFeatures: [FontFeature.tabularFigures()]),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
