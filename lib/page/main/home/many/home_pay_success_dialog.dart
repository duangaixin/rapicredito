import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomePaySuccessDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePaySuccessDialogState();

  const HomePaySuccessDialog({Key? key}) : super(key: key);
}

class _HomePaySuccessDialogState extends State<HomePaySuccessDialog> {
  var mainHomeCtr = Get.find<MainHomeCtr>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 29.0, bottom: 39.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              topTipView,
              payItemView,
              payItemView,
              payItemView,
              bottomCloseView
            ],
          ),
        ),
      ),
    );
  }

  Widget get payItemView => Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(right: 16.0, bottom: 23.0, left: 5.0),
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    CustomImageView(
                      '',
                      radius: 8.0,
                      width: 35.8,
                      height: 35.8,
                      margin:
                          EdgeInsets.only(right: 9.0, left: 11.0, top: 12.0),
                    ),
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        child: CustomImageView(
                          Resource.assetsImageHomeManyGoalOne,
                          width: 23.0,
                          height: 30.0,
                          imageType: ImageType.assets,
                        ))
                  ],
                ),
                Text(
                  '啊哈哈哈',
                  style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ),
                CustomImageView(
                  Resource.assetsImageHomeManyFireThree,
                  width: 53.0,
                  height: 20.0,
                  margin: EdgeInsets.only(left: 11.0),
                  imageType: ImageType.assets,
                )
              ],
            ),
            Container(
              height: 1.0,
              padding: EdgeInsets.only(left: 12.0, right: 1.0),
              width: double.infinity,
              color: Color(0xffEAEAEA),
            ),
            Padding(
              padding: EdgeInsets.only(left: 11.0, top: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '',
                    style: TextStyle(fontSize: 20.0, color: Color(0xff333333)),
                  ),
                  CustomColorButton(
                    realClick: null,
                    disableClick: null,
                    disableColors: const [
                      Color(0xffF5F6F4),
                      Color(0xffF5F6F4),
                    ],
                    disable: false,
                    colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
                    height: 46.0,
                    width: 152.0,
                    borderRadius: BorderRadius.circular(8.0),
                    btnContent: Text(
                      '',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: false
                              ? const Color(0xffC4BFBF)
                              : const Color(0xff333333),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget get topTipView => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomImageView(
              Resource.assetsImageResultTip,
              imageType: ImageType.assets,
              width: 103.0,
              height: 87.0,
              margin: EdgeInsets.only(top: 27.0),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0),
              child: Text(
                '¡Ha pagado con éxito el\npréstamo!',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff666666),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 44.0, bottom: 24.0),
              child: CustomButton(
                onPressed: () {},
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
      );

  Widget get bottomCloseView => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 66.0,
        color: Colors.transparent,
        margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: closeView,
      );

  Widget get closeView => CustomClickView(
      onTap: Get.back,
      child: Container(
        alignment: Alignment.center,
        width: 36.0,
        height: 36.0,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: const Text(
          'X',
          style: TextStyle(color: Color(0xff111111), fontSize: 16.0),
        ),
      ));
}
