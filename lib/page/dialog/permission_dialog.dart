import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/widget/custom_button.dart';

class PermissionDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PermissionDialogState();
  final VoidCallback rightClickConfirm;

  const PermissionDialog({
    Key? key,
    required this.rightClickConfirm,
  }) : super(key: key);
}

class _PermissionDialogState extends State<PermissionDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
      alignment: Alignment.center,
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
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: const Text(
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
          const Text(
            'Hi.there To access your eligibility and facilitate faster disbursal of your loan, we need these permissions',
            style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
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
      padding: const EdgeInsets.only(top: 10.0),
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
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: CustomButton(
              onPressed: Get.back,
              minHeight: 46.0,
              backgroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
              fontSize: 15.0,
              radius: 8.0,
              text: 'Regreso',
              textColor: const Color(0xff333333),
              fontWeight: FontWeight.bold,
              side: const BorderSide(color: Color(0xff333333), width: 1.0),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: CustomButton(
                onPressed: () {
                  Get.back();
                  widget.rightClickConfirm();
                },
                minHeight: 46.0,
                backgroundColor: const Color(0xffB8EF17),
                disabledBackgroundColor: const Color(0xffB8EF17),
                fontSize: 15.0,
                radius: 8.0,
                text: 'Confirmar',
                textColor: const Color(0xff333333),
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
