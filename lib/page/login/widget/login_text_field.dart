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
      this.maxLength = 16,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.isInputPwd = false,
      this.formatterList})
      : super(key: key);

  @override
  LoginTextFieldState createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> {
  bool _isShowPwd = false;
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
      child: Container(
        height: 14.0,
        width: 14.0,
        margin: const EdgeInsetsDirectional.only(start: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xff3D3D3D),
          borderRadius: BorderRadiusDirectional.circular(8.0),
        ),

        child: CustomImageView(
          Resource.assetsImageLoginClear,
          imageType: ImageType.assets,
          width: 19.0,
          height: 20.0,
        ),
        // child: const Icon(
        //   Icons.clear,
        //   size: 8.0,
        //   color: Color(0xFFffffff),
        // ),
      ),
      onTap: () => widget.controller.clear(),
    );

    // Widget pwdVisible = _isHideDelete
    //     ? const SizedBox.shrink()
    //     : Container(
    //         margin: const EdgeInsetsDirectional.only(end: 12.0),
    //         child: GestureDetector(
    //           behavior: HitTestBehavior.opaque,
    //           child: Icon(
    //             _isShowPwd ? Icons.visibility : Icons.visibility_off,
    //             size: 20,
    //             color: const Color(0xFFDEDEDE),
    //           ),
    //           onTap: () {
    //             setState(() {
    //               _isShowPwd = !_isShowPwd;
    //             });
    //           },
    //         ),
    //       );

    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        textField,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // if (!widget.isInputPwd) const SizedBox.shrink() else pwdVisible,
            if (_isHideDelete) const SizedBox.shrink() else clear
          ],
        ),
      ],
    );
  }
}
