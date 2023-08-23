import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/login/register/index.dart';
import 'package:rapicredito/page/login/widget/login_text_field.dart';
import 'package:rapicredito/page/login/widget/phone_text_field.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';

class RegisterPage extends GetView<RegisterCtr> {
  const RegisterPage({Key? key}) : super(key: key);

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
                          controller: TextEditingController(),
                          keyboardType: TextInputType.number,
                          hintText: Strings.autoLineString(
                              'Por favor, introduzca su número de teléfono móvil'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 41.0, bottom: 21.0),
                          child: LoginTextField(
                            keyboardType: TextInputType.number,
                            controller: TextEditingController(),
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
                          child: CustomButton(
                            onPressed: () {},
                            minHeight: 46.0,
                            minWidth: 265.0,
                            backgroundColor: const Color(0xffB8EF17),
                            disabledBackgroundColor: const Color(0xffB8EF17),
                            fontSize: 15.0,
                            radius: 8.0,
                            text: 'Continúa',
                            textColor: const Color(0xff333333),
                          ),
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
                Future.delayed(const Duration(milliseconds: 1000), () {
                  controller.state.isInitClick = false;
                  controller.startTimer();
                });
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
                    text: timeEnd.toString(),
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xff044952))),
              ]));

        return CustomClickView(
          onTap: func,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: borderColor, width: 1.0)),
            child: textWidget,
          ),
        );
      });
}
