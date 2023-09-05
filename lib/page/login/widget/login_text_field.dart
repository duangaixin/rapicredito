import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLength;
  final TextInputType keyboardType;
  final String hintText;
  final bool isInputPwd;
  final List<TextInputFormatter>? formatterList;

  const LoginTextField(
      {Key? key,
      required this.controller,
      this.maxLength = 20,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.isInputPwd = false,
      this.formatterList})
      : super(key: key);

  @override
  LoginTextFieldState createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> {
  final bool _isShowPwd = false;
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
      borderSide: BorderSide(color: Color(0xFFD7D7D7), width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      style: const TextStyle(fontSize: 18.0, color: Color(0xff333333)),
      maxLength: widget.maxLength,
      obscureText: widget.isInputPwd ? !_isShowPwd : false,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
      inputFormatters:
          widget.formatterList ?? [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 11.0),
        hintText: widget.hintText,
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
      child: const CustomImageView(
        Resource.assetsImageLoginClear,
        imageType: ImageType.assets,
        margin: EdgeInsetsDirectional.only(start: 12.0),
        width: 19.0,
        height: 20.0,
      ),
      onTap: () => widget.controller.clear(),
    );

    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        textField,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (_isHideDelete) const SizedBox.shrink() else clear
          ],
        ),
      ],
    );
  }
}
