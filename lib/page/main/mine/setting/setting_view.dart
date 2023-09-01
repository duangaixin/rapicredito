import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/mine/setting/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';

class SettingPage extends GetView<SettingCtr> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(title: 'Cambiar idioma', content: contentView);
  }

  Widget get contentView => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xffF9F9F9)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 23.0),
                  child: Text(
                    'Cambiar idioma',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 11.0, top: 16.0, left: 45.0, right: 45.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: CustomButton(
                        onPressed: controller.changeChinese,
                        minWidth: 111.0,
                        minHeight: 46.0,
                        backgroundColor: const Color(0xffB8EF17),
                        disabledBackgroundColor: const Color(0xffB8EF17),
                        fontSize: 15.0,
                        radius: 8.0,
                        text: 'en'.tr,
                        textColor: const Color(0xff333333),
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Expanded(
                          child: CustomButton(
                        onPressed:controller.changeEs,
                        minWidth: 111.0,
                        minHeight: 46.0,
                        backgroundColor: Colors.white,
                        disabledBackgroundColor: Colors.white,
                        fontSize: 15.0,
                        radius: 8.0,
                        text: 'es'.tr,
                        textColor: const Color(0xff333333),
                        fontWeight: FontWeight.bold,
                        side: const BorderSide(
                            color: Color(0xff333333), width: 1.0),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 132.0),
            child: CustomButton(
              onPressed: controller.logout,
              minWidth: 111.0,
              minHeight: 46.0,
              backgroundColor: Colors.white,
              disabledBackgroundColor: Colors.white,
              fontSize: 15.0,
              radius: 8.0,
              text: 'Salir',
              textColor: const Color(0xff333333),
              fontWeight: FontWeight.bold,
              side: const BorderSide(color: Color(0xff333333), width: 1.0),
            ),
          )
        ],
      );
}
