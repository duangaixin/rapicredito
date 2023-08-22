import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/home/widget/common_loan_money_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeFailedView extends GetView<MainHomeCtr> {
  const HomeFailedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const MainAppBarView(
          title: 'Préstamo fallido',
        ),
        const CommonLoanMoneyView(),
        Padding(
          padding: const EdgeInsets.only(
              top: 25.0, left: 55.0, right: 55.0, bottom: 46.0),
          child: CustomButton(
            onPressed: () {},
            minHeight: 46.0,
            backgroundColor: const Color(0xffB8EF17),
            disabledBackgroundColor: const Color(0xffB8EF17),
            fontSize: 15.0,
            radius: 8.0,
            text: 'Actualizar cuenta receptora',
            textColor: const Color(0xff333333),
          ),
        ),
        errorTipView,
      ],
    );
  }

  Widget get errorTipView => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.only(
            left: 25.0, top: 14.0, right: 18.0, bottom: 21.0),
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(8.0)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  Resource.assetsImageHomeErrorTip,
                  imageType: ImageType.assets,
                  width: 27.0,
                  height: 28.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Lo siento',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffD53535),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 13.0),
              child: Text(
                'El sistema ha detectado que la información de su cuenta bancaria no se ha sido completado correctamente,   cárguela de nuevo.',
                style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
              ),
            )
          ],
        ),
      );
}
