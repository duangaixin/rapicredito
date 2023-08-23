import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeRefusalToLendView extends GetView<MainHomeCtr> {
  const HomeRefusalToLendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const MainAppBarView(
          title: 'Solicitud rechazada',
        ),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(Resource.assetsImageAuthCameraBg),
                  fit: BoxFit.cover)),
          margin: const EdgeInsets.only(top: 20.0, left: 54.0, right: 54.0),
          padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 49.0,bottom: 49.0),
          child: const Text(
            'Solicitud\nrechazado',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
        ),
        errorTipView,
      ],
    );
  }

  Widget get errorTipView => Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 39.0),
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
                'Su puntaje de crédito está por debajo de los requisitos mínimos para préstamos de plataforma.',
                style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
              ),
            )
          ],
        ),
      );
}
