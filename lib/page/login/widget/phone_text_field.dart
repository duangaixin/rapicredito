import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLength;
  final TextInputType keyboardType;
  final String hintText;
  final bool isInputPwd;
  final List<TextInputFormatter>? formatterList;
  final Widget? leftView;

  const PhoneTextField(
      {Key? key,
      required this.controller,
      this.maxLength = 16,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.isInputPwd = false,
      this.leftView,
      this.formatterList})
      : super(key: key);

  @override
  PhoneTextFieldState createState() => PhoneTextFieldState();
}

class PhoneTextFieldState extends State<PhoneTextField> {
  bool _isHideDelete = false;

  @override
  void initState() {
    _isHideDelete = widget.controller.text.isEmpty;
    widget.controller.addListener(isEmpty);
    super.initState();
  }

  void isEmpty() {
    var isEmpty = widget.controller.text.isEmpty;
    if (isEmpty != _isHideDelete) {
      setState(() {
        _isHideDelete = isEmpty;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(isEmpty);
    super.dispose();
  }

  InputBorder _getBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      style: const TextStyle(fontSize: 18.0, color: Color(0xff333333)),
      maxLength: widget.maxLength,
      obscureText: false,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
      inputFormatters:
          widget.formatterList ?? [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        hintText: widget.hintText,
        hintMaxLines: _isHideDelete ? 2 : 1,
        hintStyle: const TextStyle(color: Color(0xFFCBCBCB), fontSize: 14.0),
        counterText: '',
        focusedBorder: _getBorder(),
        enabledBorder: _getBorder(),
        focusedErrorBorder: _getBorder(),
        errorBorder: _getBorder(),
      ),
    );

    Widget clear = GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 14.0,
        width: 14.0,
        margin: const EdgeInsets.only(left: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xffDEDEDE),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const CustomImageView(
          Resource.assetsImageLoginClear,
          imageType: ImageType.assets,
          width: 19.0,
          height: 20.0,
        ),
      ),
      onTap: () => widget.controller.clear(),
    );

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  Resource.assetsImageMainOne,
                  imageType: ImageType.assets,
                  width: 19,
                  height: 23,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 28.0, left: 3.0),
                  child: Text(
                    '+57',
                    style: TextStyle(fontSize: 16.0, color: Color(0xff333333)),
                  ),
                )
              ],
            ),
            Expanded(child: textField),
            if (_isHideDelete) const SizedBox.shrink() else clear
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 15.0),
          height: 1.0,
          color: const Color(0xFFD7D7D7),
        )
      ],
    );
  }
}
