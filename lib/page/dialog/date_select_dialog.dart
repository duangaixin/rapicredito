import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';


class DateSelectDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DateSelectDialogState();
  final Function clickConfirm;

  const DateSelectDialog({
    Key? key,
    required this.clickConfirm,
  }) : super(key: key);
}

class _DateSelectDialogState extends State<DateSelectDialog> {
  final TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: 442.0,
        margin: const EdgeInsets.only(top: 178.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: _buildDialog()), _buildBottomView()],
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return  Container(
      width: double.infinity,
      height: 371.0,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Resource.assetsImageDateSelectDialog),
              fit: BoxFit.cover)),
    );

  }

  Widget _buildBottomView() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: CustomButton(
        onPressed: widget.clickConfirm(),
        minWidth: 265.0,
        minHeight: 46.0,
        backgroundColor: const Color(0xffB8EF17),
        disabledBackgroundColor: const Color(0xffB8EF17),
        fontSize: 15.0,
        radius: 8.0,
        text: 'Lo tengo',
        textColor: const Color(0xff333333),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
