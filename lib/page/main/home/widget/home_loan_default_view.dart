import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeLoanDefaultView extends GetView<MainHomeCtr> {
  const HomeLoanDefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const MainAppBarView(
          title: 'RapiCrédito',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cantidad máxima',
                    style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        border: Border.all(
                            color: const Color(0xff333333), width: 1.0)),
                    child: const Text(
                      '91 Días',
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 46.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const CustomImageView(
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
                                  const Text(
                                    'Cantidad máxima',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff999999)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 13.0),
                                    child: Obx(() {
                                      return Text(
                                        controller.state.maxAmount,
                                        style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Color(0xff333333)),
                                      );
                                    }),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 27.0, bottom: 24.0),
                        child: CustomButton(
                          onPressed: controller.goToAuthPage,
                          minHeight: 46.0,
                          minWidth: 265.0,
                          backgroundColor: const Color(0xffB8EF17),
                          disabledBackgroundColor: const Color(0xffB8EF17),
                          fontSize: 15.0,
                          radius: 8.0,
                          text: 'Aplica ya',
                          textColor: const Color(0xff333333),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        color: const Color(0xffF3F3F3),
                        width: 296.0,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 26.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
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
                  'Bajo', 'cargo por servicio', '-10%', Color(0xffB8EF17)),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildBottomItemView(
                    'APP', 'Descargas de la', '100M+', const Color(0xff044952)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildBottomItemView('Bajo', 'cargo por servicio',
                    '-10%', const Color(0xff1E1E1E)),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: CommonAgreeView(),
              ),
            ],
          ),
        )
      ],
    ));
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
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18.0, color: Color(0xff333333)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      subTitle,
                      style: const TextStyle(
                          fontSize: 18.0, color: Color(0xff999999)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          number,
          style: const TextStyle(fontSize: 18.0, color: Color(0xffD53535)),
        )
      ],
    );
  }
}
