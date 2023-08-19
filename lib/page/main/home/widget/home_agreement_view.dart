import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/utils/string_ext.dart';


class HomeAgreeView extends GetView<MainHomeCtr> {
  const HomeAgreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0, bottom: 30.0),
      child: RichText(
          text: TextSpan(
              text: Strings.autoLineString('Lea atentamente todas las '),
              style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
              children: <TextSpan>[
            TextSpan(
                text: Strings.autoLineString('Aviso de Privacidad.'),
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15.0,
                    color: Color(0xff6B8817)),
                recognizer: TapGestureRecognizer()..onTap = () {}),
            TextSpan(
                text: Strings.autoLineString('y'),
                style: TextStyle(fontSize: 15.0, color: Color(0xff666666))),
            TextSpan(
                text: Strings.autoLineString('Terminos y Condiciones'),
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15.0,
                    color: Color(0xff6B8817)),
                recognizer: TapGestureRecognizer()..onTap = () {}),
          ])),
    );
  }
}
