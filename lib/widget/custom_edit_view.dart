import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CustomEditView extends StatefulWidget {
  const CustomEditView({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    this.hintStyle,
    this.editStyle,
    this.titleStyle,
    this.errorStyle,
    this.rightWidget,
    this.focusNode,
    this.submitAction,
    this.textChangeAction,
    this.enableEdit = true,
    this.hintText = '',
    this.errorText = '',
    this.editTitle = '',
    this.maxLength,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String editTitle;
  final String errorText;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType keyboardType;
  final bool enableEdit;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextStyle? editStyle;
  final Widget? rightWidget;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function(String s)? submitAction;
  final Function(String s)? textChangeAction;

  @override
  CustomEditViewState createState() => CustomEditViewState();
}

class CustomEditViewState extends State<CustomEditView> {
  bool _isHideDelete = false;

  @override
  void initState() {
    super.initState();
    _isHideDelete = widget.controller.text.isEmpty;
    widget.controller.addListener(isEmpty);
  }

  @override
  void dispose() {
    widget.controller.removeListener(isEmpty);
    super.dispose();
  }

  void isEmpty() {
    bool isEmpty = widget.controller.text.isEmpty;
    if (isEmpty != _isHideDelete) {
      setState(() {
        _isHideDelete = isEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget titleView = ObjectUtil.isEmptyString(widget.editTitle)
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              widget.editTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: widget.titleStyle ??
                  const TextStyle(fontSize: 16.0, color: Color(0xff333333)),
            ),
          );
    Widget textFiled = TextField(
      maxLength: widget.maxLength,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatter,
      enabled: widget.enableEdit,
      focusNode: widget.focusNode,
      onSubmitted: (s) {
        widget.submitAction?.call(s);
      },
      onChanged: (s) {
        widget.textChangeAction?.call(s);
      },
      maxLines: null,
      minLines: 1,
      textInputAction: TextInputAction.done,
      style: widget.editStyle ??
          const TextStyle(fontSize: 15.0, color: Color(0xff222222)),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
        hintText: widget.hintText,
        hintMaxLines: 1,
        hintStyle: widget.hintStyle ??
            const TextStyle(fontSize: 15.0, color: Color(0xff9395A8)),
        counterText: '',
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder:
            const UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );

    Widget rightView = _isHideDelete || !widget.enableEdit
        ? const SizedBox.shrink()
        : widget.rightWidget ??
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: const CustomImageView(
                Resource.assetsImageLoginClear,
                imageType: ImageType.assets,
                margin: EdgeInsets.only(left: 12.0),
                width: 19.0,
                height: 20.0,
              ),
              onTap: () => widget.controller.clear(),
            );
    Widget line = Container(
      height: 0.5,
      color: ObjectUtil.isEmptyString(widget.errorText)
          ? const Color(0xffE2E2E2)
          : const Color(0xffFF5544),
    );
    Widget errorText = ObjectUtil.isEmptyString(widget.errorText)
        ? const SizedBox.shrink()
        : Text(
            maxLines: 1,
            widget.errorText,
            style: widget.errorStyle ??
                const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xffFF3B28),
                  overflow: TextOverflow.ellipsis,
                ),
          );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleView,
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(child: textFiled), rightView],
        ),
        line,
        errorText
      ],
    );
  }
}
