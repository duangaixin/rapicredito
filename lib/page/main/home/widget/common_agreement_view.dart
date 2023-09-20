import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/string_ext.dart';

class CommonAgreeView extends StatefulWidget {
  const CommonAgreeView({
    Key? key,
  }) : super(key: key);

  @override
  CommonAgreeViewState createState() => CommonAgreeViewState();
}

class CommonAgreeViewState extends State<CommonAgreeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(top: 25.0),
      child: RichText(
          text: TextSpan(
              text: Strings.autoLineString('Lea atentamente todas las '),
              style: const TextStyle(fontSize: 15.0, color: Color(0xff666666)),
              children: <TextSpan>[
            TextSpan(
                text: Strings.autoLineString('Aviso de Privacidad.'),
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15.0,
                    color: Color(0xff6B8817)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _goToWebViewPage('Aviso de Privacidad', 'https://www.rapicreditoco.com/rapicreditos/privacy.html');
                  }),
            TextSpan(
                text: Strings.autoLineString('y'),
                style:
                    const TextStyle(fontSize: 15.0, color: Color(0xff666666))),
            TextSpan(
                text: Strings.autoLineString('Terminos y Condiciones'),
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15.0,
                    color: Color(0xff6B8817)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _goToWebViewPage('Terminos y Condiciones', 'https://test.rapicreditoco.com/rapicreditos/Term.html');
                  }),
          ])),
    );
  }

  void _goToWebViewPage(String title, String webViewUrl) {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.webViewPage, arguments: {
      AppConstants.webViewTitleKey: title,
      AppConstants.webViewUrlKey: webViewUrl
    });
  }
}
