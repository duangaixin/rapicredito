import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_dash_line.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CommonPayTwoWayView extends GetView<MainHomeCtr> {
  const CommonPayTwoWayView({Key? key}) : super(key: key);

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
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
            child: const Text(
              'Método de devolver',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Visibility(
              visible: controller.state.onePayShow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDashLine(
                    color: Color(0xffE2E5DA),
                    dashWidth: 5.0,
                  ),
                  centerPayView
                ],
              )),
          Visibility(
              visible: controller.state.twoPayShow,
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
              )),
        ],
      );

  Widget get centerPayView => Container(
        padding: const EdgeInsets.only(
            left: 14.0, right: 13.0, top: 11.0, bottom: 11.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     CustomImageView(
            //       Resource.assetsImageAuthTakeCamera,
            //       imageType: ImageType.assets,
            //       width: 95.0,
            //       height: 40.0,
            //       margin: EdgeInsets.only(right: 8.0),
            //     ),
            //     Stack(
            //       children: [
            //         Text(
            //           'PSE',
            //           style:
            //               TextStyle(fontSize: 16.0, color: Color(0xff101F36)),
            //         ),
            //         Positioned(
            //             top: -14,
            //             right: 0,
            //             child: CustomImageView(
            //               '',
            //               imageType: ImageType.assets,
            //               width: 15.0,
            //               height: 14.0,
            //               margin: EdgeInsets.only(right: 8.0),
            //             )),
            //       ],
            //     )
            //   ],
            // ),
            const CustomImageView(
              Resource.assetsImagePayPse,
              imageType: ImageType.assets,
              width: 134.0,
              height: 40.0,
            ),
            CustomButton(
              onPressed: () {
                controller.postQueryRepayUrlRequest(PayType.payOne);
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
      );

  Widget get bottomPayView => Container(
      padding: const EdgeInsets.only(
          left: 14.0, right: 13.0, top: 11.0, bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomImageView(Resource.assetsImagePayEfe,
                  imageType: ImageType.assets, width: 142.0, height: 37.0),
              CustomButton(
                onPressed: () {
                  controller.postQueryRepayUrlRequest(PayType.payTwo);
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
          const CustomImageView(Resource.assetsImagePayTwoBottom,
              imageType: ImageType.assets,
              width: double.infinity,
              height: 40.0,
              radius: 8.0,
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0)),
        ],
      ));
}
