import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class MessageInputDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageInputDialogState();
  final Function(String s) clickConfirm;

  const MessageInputDialog({
    Key? key,
    required this.clickConfirm,
  }) : super(key: key);
}

class _MessageInputDialogState extends State<MessageInputDialog> {
  final TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: 405.0,
        margin: const EdgeInsets.only(top: 73.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: _buildDialog()), _buildCancelView()],
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          height: 342.0,
          padding: const EdgeInsets.only(
              top: 19.0, left: 10.0, right: 10.0, bottom: 28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTopView(),
              Expanded(child: _buildTextFieldView()),
              _buildBottomButtonView(),
            ],
          ),
        ));
  }

  Widget _buildTopView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        CustomImageView(
          Resource.assetsImageMessageDialog,
          imageType: ImageType.assets,
          width: 76.0,
          height: 70.0,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Text(
            'Darse cuenta',
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buildTextFieldView() {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffD4D4D4), width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
          controller: ctr,
          maxLength: 200,
          style: const TextStyle(fontSize: 14.0, color: Color(0xff666666)),
          maxLines: null,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(13, 15, 13, 16),
              border: InputBorder.none,
              counterText: '',
              hintText: '',
              hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black12,
                  textBaseline: TextBaseline.alphabetic))),
    );
  }

  Widget _buildBottomButtonView() {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: CustomButton(
        onPressed: widget.clickConfirm(''),
        minWidth: 179.0,
        minHeight: 46.0,
        backgroundColor: const Color(0xffB8EF17),
        disabledBackgroundColor: const Color(0xffB8EF17),
        fontSize: 15.0,
        radius: 8.0,
        text: 'OK',
        textColor: const Color(0xff333333),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCancelView() {
    return CustomClickView(
        onTap: Get.back,
        child: Container(
          height: 46.0,
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 10.0),
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
