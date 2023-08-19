import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/home_agreement_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeDefaultView extends GetView<MainHomeCtr> {
  const HomeDefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          titleSpacing: 0,
          title: leftView,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cantidad máxima',
              style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Text(
                  '91 Días',
                  style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    border: Border.all(color: Color(0xff333333), width: 1.0)),
              ),
              onTap: () {},
            )
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: 46.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      Resource.assetsImageHomeDefault,
                      imageType: ImageType.assets,
                      width: 267.0,
                      height: 142.0,
                    ),
                    Positioned(
                        bottom: 16.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Cantidad máxima',
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff999999)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13.0),
                              child: Text(
                                '222222',
                                style: TextStyle(
                                    fontSize: 30.0, color: Color(0xff333333)),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 27.0, bottom: 24.0),
                  child: CustomButton(
                    onPressed: () {},
                    minHeight: 46.0,
                    minWidth: 265.0,
                    backgroundColor: Color(0xffB8EF17),
                    disabledBackgroundColor: Color(0xffB8EF17),
                    fontSize: 15.0,
                    radius: 8.0,
                    text: 'Aplica ya',
                    textColor: Color(0xff333333),
                  ),
                ),
                Container(
                  height: 1.0,
                  color: Color(0xffF3F3F3),
                  width: 296.0,
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(top: 26.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '¿Por qué elegir este producto?',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        _buildBottomItemView(
            'Bajo', 'cargo por servicio', '10', Color(0xffB8EF17)),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: _buildBottomItemView(
              'APP', 'Descargas de la', '10', Color(0xff044952)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: _buildBottomItemView(
              'Bajo', 'cargo por servicio', '10', Color(0xff1E1E1E)),
        ),
        HomeAgreeView()
      ],
    );
  }

  Widget _buildBottomItemView(
      String title, String subTitle, String number, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0), color: color),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18.0, color: Color(0xff333333)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(
                      subTitle,
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xff999999)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          number,
          style: TextStyle(fontSize: 18.0, color: Color(0xffD53535)),
        )
      ],
    );
  }

  Widget get leftView => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('RapiCredito',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colour.text33,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
        ],
      );
}
