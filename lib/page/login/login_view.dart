import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/login/login_ctr.dart';
import 'package:rapicredito/page/login/widget/login_text_field.dart';
import 'package:rapicredito/page/login/widget/phone_text_field.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class LoginPage extends GetView<LoginCtr> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
      titleSpace: 14.0,
      title: 'Regresar',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 59.0, bottom: 80.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cantidad máxima',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Inice sesión ahora para solicitar su préstamo',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff999999),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        PhoneTextField(
                          controller: controller.phoneCtr,
                          keyboardType: TextInputType.number,
                          hintText: Strings.autoLineString(
                              'Por favor, introduzca su número de teléfono móvil'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 41.0, bottom: 21.0),
                          child: LoginTextField(
                            keyboardType: TextInputType.number,
                            controller: controller.codeCtr,
                            hintText: Strings.autoLineString(
                                'Por favor ingrese el código de verificación'),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [optView],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 39.0, right: 39.0, top: 33.0),
                          child: Obx(() {
                            return CustomColorButton(
                              realClick: controller.postLoginRequest,
                              disableClick: controller.showTip,
                              disableColors: const [
                                Color(0xffF5F6F4),
                                Color(0xffF5F6F4)
                              ],
                              disable: controller.state.btnLoginDisableClick,
                              colors: const [
                                Color(0xffB8EF17),
                                Color(0xffB8EF17)
                              ],
                              height: 46.0,
                              borderRadius: BorderRadius.circular(8.0),
                              btnContent: Text(
                                'Continúa',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: controller.state.btnLoginDisableClick
                                        ? const Color(0xffC4BFBF)
                                        : const Color(0xff333333),
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ))),
          const Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: CommonAgreeView(),
          )
        ],
      ),
    );
  }

  Widget get optView => Obx(() {
        var initClick = controller.state.isInitClick;
        var timeEnd = controller.state.timeEnd;
        var str = initClick
            ? 'Obtener el OTP'
            : (timeEnd <= 0
                ? 'Volver a enviar código'
                : 'Código de reserva en ');
        var style = initClick
            ? const TextStyle(color: Color(0xff044952), fontSize: 14.0)
            : (timeEnd <= 0
                ? const TextStyle(color: Color(0xff044952), fontSize: 14.0)
                : const TextStyle(
                    fontSize: 14.0,
                    color: Color(0xffCAC6C6),
                    fontFeatures: [FontFeature.tabularFigures()]));
        var borderColor = initClick
            ? const Color(0xff044952)
            : (timeEnd <= 0
                ? const Color(0xff044952)
                : const Color(0xffCAC6C6));

        var func = initClick || timeEnd <= 0
            ? () {
                if (!ObjectUtil.isEmptyString(
                    controller.phoneCtr.text.strRvSpace())) {
                  controller.postSendCodeRequest();
                } else {
                  ProgressHUD.showInfo(
                      'Por favor ingrese el número de teléfono móvil');
                }
              }
            : null;
        var textWidget = initClick || timeEnd <= 0
            ? Text(
                str,
                style: style,
              )
            : RichText(
                text: TextSpan(text: str, style: style, children: <TextSpan>[
                TextSpan(
                    text: '${timeEnd.toString().padLeft(2, '0')}s',
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xff044952))),
              ]));

        return CustomClickView(
          onTap: func,
          child: Obx(() {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
              decoration: BoxDecoration(
                  color: controller.state.btnOptDisableClick
                      ? const Color(0xffF5F6F4)
                      : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: controller.state.btnOptDisableClick
                          ? Colors.transparent
                          : borderColor,
                      width: 1.0)),
              child: textWidget,
            );
          }),
        );
      });
}
