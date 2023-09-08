import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';

class NoNetDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoNetDialogState();
  final Function clickConfirm;

  const NoNetDialog({
    Key? key,
    required this.clickConfirm,
  }) : super(key: key);
}

class _NoNetDialogState extends State<NoNetDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: 340.0,
        margin: const EdgeInsets.only(top: 150.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: _buildDialog()), _buildCancelView()],
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      width: double.infinity,
      height: 279.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0, left: 26.0, right: 26.0),
            child: Text(
              'La red es anormal, intente nuevamente',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
            ),
          ),
          const Spacer(),
          _buildBottomView(),
        ],
      ),
    );
  }

  Widget _buildBottomView() {
    return Container(
      margin: const EdgeInsets.only(bottom: 44.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: CustomButton(
            onPressed: Get.back,
            minWidth: 152.0,
            minHeight: 46.0,
            backgroundColor: Colors.white,
            disabledBackgroundColor: Colors.white,
            fontSize: 15.0,
            radius: 8.0,
            text: 'Regreso',
            textColor: const Color(0xff333333),
            fontWeight: FontWeight.bold,
            side: const BorderSide(color: Color(0xff333333), width: 1.0),
          )),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: CustomButton(
            onPressed: () {
              Get.back();
              widget.clickConfirm();
            },
            minWidth: 152.0,
            minHeight: 46.0,
            backgroundColor: const Color(0xffB8EF17),
            disabledBackgroundColor: const Color(0xffB8EF17),
            fontSize: 15.0,
            radius: 8.0,
            text: 'Confirmar',
            textColor: const Color(0xff333333),
            fontWeight: FontWeight.bold,
          ))
        ],
      ),
    );
  }

  Widget _buildCancelView() {
    return CustomClickView(
        onTap: Get.back,
        child: Container(
          height: 54.0,
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 18.0),
          child: Container(
            alignment: Alignment.center,
            width: 36.0,
            height: 36.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const Text(
              'X',
              style: TextStyle(color: Color(0xff111111), fontSize: 16.0),
            ),
          ),
        ));
  }
}
