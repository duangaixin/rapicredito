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
          const CustomDashLine(
            color: Color(0xffE2E5DA),
            dashWidth: 5.0,
          ),
          centerPayView,
          const CustomDashLine(
            color: Color(0xffE2E5DA),
            dashWidth: 5.0,
          ),
          bottomPayView
        ],
      );

  Widget get centerPayView => Container(
        padding: const EdgeInsets.only(
            left: 14.0, right: 13.0, top: 11.0, bottom: 11.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  Resource.assetsImageAuthTakeCamera,
                  imageType: ImageType.assets,
                  width: 95.0,
                  height: 40.0,
                  margin: EdgeInsets.only(right: 8.0),
                ),
                Stack(
                  children: [
                    Text(
                      'PSE',
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xff101F36)),
                    ),
                    Positioned(
                        top: -14,
                        right: 0,
                        child: CustomImageView(
                          '',
                          imageType: ImageType.assets,
                          width: 15.0,
                          height: 14.0,
                          margin: EdgeInsets.only(right: 8.0),
                        )),
                  ],
                )
              ],
            ),
            CustomButton(
              onPressed: () {},
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
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    Resource.assetsImageAuthTakeCamera,
                    imageType: ImageType.assets,
                    width: 64.0,
                    height: 37.0,
                    margin: EdgeInsets.only(right: 16.0),
                  ),
                  Text(
                    'Efectivo',
                    style: TextStyle(fontSize: 16.0, color: Color(0xff101F36)),
                  ),
                ],
              ),
              CustomButton(
                onPressed: () {},
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
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            padding: EdgeInsets.only(
                left: 8.0, right: 10.0, top: 11.0, bottom: 11.0),
            decoration: BoxDecoration(
              color: Color(0xffF9F9F9),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: CustomImageView(
                  Resource.assetsImageAuthTakeCamera,
                  imageType: ImageType.assets,
                  width: 43.44,
                  height: 15.51,
                  margin: EdgeInsets.only(right: 10.0),
                )),
                Expanded(
                    child: CustomImageView(
                  Resource.assetsImageAuthTakeCamera,
                  imageType: ImageType.assets,
                  width: 43.44,
                  height: 15.51,
                  margin: EdgeInsets.only(right: 10.0),
                )),
                Expanded(
                    child: CustomImageView(
                  Resource.assetsImageAuthTakeCamera,
                  imageType: ImageType.assets,
                  width: 43.44,
                  height: 15.51,
                  margin: EdgeInsets.only(right: 10.0),
                )),
                Expanded(
                    child: CustomImageView(
                  Resource.assetsImageAuthTakeCamera,
                  imageType: ImageType.assets,
                  width: 43.44,
                  height: 15.51,
                  margin: EdgeInsets.only(right: 10.0),
                )),
                Expanded(
                    child: CustomImageView(
                  Resource.assetsImageAuthTakeCamera,
                  imageType: ImageType.assets,
                  width: 60,
                  height: 15.51,
                )),

                // CustomImageView(
                //   Resource.assetsImageAuthTakeCamera,
                //   imageType: ImageType.assets,
                //   width: 43.44,
                //   height: 15.51,
                //   margin: EdgeInsets.only(right: 10.0),
                // ),
                // CustomImageView(
                //   Resource.assetsImageAuthTakeCamera,
                //   imageType: ImageType.assets,
                //   width: 47.22,
                //   height: 17.45,
                //   margin: EdgeInsets.only(right: 10.0),
                // ),
                // CustomImageView(
                //   Resource.assetsImageAuthTakeCamera,
                //   imageType: ImageType.assets,
                //   width: 51,
                //   height: 17.45,
                //   margin: EdgeInsets.only(right: 8.0),
                // ),
                // CustomImageView(
                //   Resource.assetsImageAuthTakeCamera,
                //   imageType: ImageType.assets,
                //   width: 61.39,
                //   height: 17.45,
                //   margin: EdgeInsets.only(right: 7.0),
                // ),
                // CustomImageView(
                //   Resource.assetsImageAuthTakeCamera,
                //   imageType: ImageType.assets,
                //   width: 54.77,
                //   height: 14.54,
                // ),
              ],
            ),
          )
        ],
      ));
}
