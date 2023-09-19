import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_dash_line.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CommonPayThreeWayView extends GetView<MainHomeCtr> {
  final bool isRollover;

  const CommonPayThreeWayView({Key? key, this.isRollover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color(0xff333333), width: 1.0)),
      child: contentView,
    );
  }

  Widget get contentView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          onePayView,
          Obx(() {
            return Visibility(
                visible: controller.mainHomeState.fourPayShow,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDashLine(
                      color: Color(0xffE2E5DA),
                      dashWidth: 5.0,
                    ),
                    centerPayView,
                  ],
                ));
          }),
          Obx(() {
            return Visibility(
                visible: controller.mainHomeState.fivePayShow,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDashLine(
                      color: Color(0xffE2E5DA),
                      dashWidth: 5.0,
                    ),
                    bottomPayView
                  ],
                ));
          }),
        ],
      );

  Widget get onePayView => Container(
        padding: const EdgeInsets.only(left: 14.0, right: 13.0, top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return Visibility(
                  visible: controller.mainHomeState.threePayShow,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomImageView(Resource.assetsImagePayEfe,
                          imageType: ImageType.assets,
                          width: 142.0,
                          height: 37.0),
                      CustomButton(
                        onPressed: () {
                          controller.clickPayType(PayType.payThree,
                              isRollover: isRollover);
                        },
                        minWidth: 111.0,
                        minHeight: 46.0,
                        backgroundColor: const Color(0xffB8EF17),
                        disabledBackgroundColor: const Color(0xffB8EF17),
                        fontSize: 15.0,
                        radius: 8.0,
                        text: 'Pagar',
                        textColor: const Color(0xff333333),
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ));
            }),
            const CustomImageView(Resource.assetsImagePayThreeCenter,
                imageType: ImageType.assets,
                width: double.infinity,
                height: 39.0,
                radius: 8.0,
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0)),
          ],
        ),
      );

  Widget get centerPayView => Container(
      padding: const EdgeInsets.only(
          left: 14.0, right: 13.0, top: 11.0, bottom: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomImageView(Resource.assetsImagePayThreeVisa,
                  imageType: ImageType.assets, width: 105, height: 29.0),
              CustomButton(
                onPressed: () {
                  controller.clickPayType(PayType.payFour,
                      isRollover: isRollover);
                },
                minWidth: 111.0,
                minHeight: 46.0,
                backgroundColor: const Color(0xffB8EF17),
                disabledBackgroundColor: const Color(0xffB8EF17),
                fontSize: 15.0,
                radius: 8.0,
                text: 'Pagar',
                textColor: const Color(0xff333333),
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ));

  Widget get bottomPayView => Container(
      padding: const EdgeInsets.only(
          left: 14.0, right: 13.0, top: 11.0, bottom: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomImageView(
                Resource.assetsImagePayPse,
                imageType: ImageType.assets,
                width: 134.0,
                height: 40.0,
              ),
              CustomButton(
                onPressed: () {
                  controller.clickPayType(PayType.payFive,
                      isRollover: isRollover);
                },
                minWidth: 111.0,
                minHeight: 46.0,
                backgroundColor: const Color(0xffB8EF17),
                disabledBackgroundColor: const Color(0xffB8EF17),
                fontSize: 15.0,
                radius: 8.0,
                text: 'Pagar',
                textColor: const Color(0xff333333),
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ));
}
