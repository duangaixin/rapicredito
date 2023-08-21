import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rapicredito/utils/string_ext.dart';

class PermissionDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PermissionDialogState();
  final VoidCallback leftClickConfirm;
  final VoidCallback rightClickConfirm;

  const PermissionDialog({
    Key? key,
    required this.leftClickConfirm,
    required this.rightClickConfirm,
  }) : super(key: key);
}

class _PermissionDialogState extends State<PermissionDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(top: 23.0, bottom: 7.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleView(),
          Expanded(child: _buildContentView()),
          _buildBottomView()
        ],
      ),
    );
  }

  Widget _buildTitleView() {
    return const Center(
      child: Text(
        'Permiso',
        style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff333333),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContentView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
            child: Text(
              'Hi.there To access your eligibility and facilitate faster disbursal of your loan, we need these permissions',
              style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
            ),
          ),
          _buildItemView('SMS',
              'Collect and monitor only financial transaction Introducir texto messages including the name of the transaction party. The purpose is to conduct a credit risk assessment of the transaction and the description of the transaction amount. This credit risk assessment speeds up loan disbursement without any Perfil Introducir texto messages being deleted, read or collected'),
          _buildItemView('Contacts',
              'The NBFC loan process and guidelines mandates us to verify references. This feature enables us to do that & Why type in contact number when you can just choose from your contact book.'),
          _buildItemView('Camera and Photos', ''),
        ],
      ),
    );
  }

  Widget _buildItemView(String title, String content) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 15.0, color: Color(0xff666666)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomView() {
    return Container(
      margin: const EdgeInsets.only(top: 18.0, left: 6.0, right: 6.0),
      decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 24.0, right: 24.0, bottom: 18.0),
            child: RichText(
                text: TextSpan(
                    text: Strings.autoLineString('Lea atentamente todas las '),
                    style: const TextStyle(
                        fontSize: 15.0, color: Color(0xff666666)),
                    children: <TextSpan>[
                  TextSpan(
                      text: Strings.autoLineString('Aviso de Privacidad.'),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          color: Color(0xff6B8817)),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                      text: Strings.autoLineString('y'),
                      style: const TextStyle(
                          fontSize: 15.0, color: Color(0xff666666))),
                  TextSpan(
                      text: Strings.autoLineString('Terminos y Condiciones'),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          color: Color(0xff6B8817)),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ])),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 25.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    height: 46.0,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 46.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      // child: CustomButton(
      //   text: 'OK',
      //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
    );
  }
}
