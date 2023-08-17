import 'package:flutter/material.dart';
import 'package:rapicredito/widget/custom_button.dart';

class InputDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputDialogState();
  final Function(String s) clickConfirm;
  final String title;

  const InputDialog({
    Key? key,
    this.title = '',
    required this.clickConfirm,
  }) : super(key: key);
}

class _InputDialogState extends State<InputDialog> {
  final TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 280.0,
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildTitleView(),
          Expanded(child: _buildTextFieldView()),
          _buildBottomButtonView(context)
        ],
      ),
    );
  }

  Widget _buildTitleView() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40.0,
      child: Text('测试'),
    );
  }


  Widget _buildTextFieldView() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.white),
      child: Material(
        child: TextField(
            controller: ctr,
            maxLength: 200,
            style: const TextStyle(fontSize: 13.0,color: Colors.black87),
            maxLines: null,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                border: InputBorder.none,
                counterText: '',
                hintText: '请输入',
                hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black12,
                    textBaseline: TextBaseline.alphabetic))),
      ),
    );
  }

  Widget _buildBottomButtonView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child:  CustomButton(
        text: 'OK',
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        onPressed: () {
          Navigator.pop(context);
        },

      ),
    );
  }
}
