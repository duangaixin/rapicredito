import 'package:flutter/material.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/custom_click_view.dart';


class CustomSelectView extends StatefulWidget {
  const CustomSelectView(
      {Key? key,
      this.hintStyle,
      this.editContentStyle,
      this.titleStyle,
      this.errorStyle,
      this.hintText = '',
      this.errorText = '',
      this.editTitle = '',
      this.editContent = '',
      this.rightWidget,
      this.enableEdit = true,
      this.action})
      : super(key: key);
  final String hintText;
  final String editTitle;
  final String editContent;
  final String errorText;
  final bool enableEdit;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextStyle? editContentStyle;
  final Widget? rightWidget;
  final VoidCallback? action;

  @override
  CustomSelectViewState createState() => CustomSelectViewState();
}

class CustomSelectViewState extends State<CustomSelectView> {
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

    Widget contentView = Padding(
      padding: const EdgeInsets.only(top: 7.0, bottom: 8.0),
      child: Text(
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        ObjectUtil.isEmptyString(widget.editContent)
            ? widget.hintText
            : widget.editContent,
        style: ObjectUtil.isEmptyString(widget.editContent)
            ? widget.hintStyle ??
                const TextStyle(fontSize: 15.0, color: Color(0xff999999))
            : widget.editContentStyle ??
                const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
      ),
    );

    Widget rightView = widget.rightWidget ??
        Container(
          margin: const EdgeInsets.only(top: 12.0, bottom: 10.0),
          alignment: Alignment.center,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xff6a6a6a),
            size: 17,
          ),
        );
    Widget line = Container(
      height: 0.5,
      color: ObjectUtil.isEmptyString(widget.errorText)
          ? const Color(0xffEBEBEB)
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
        CustomClickView(
          onTap: widget.enableEdit ? widget.action : null,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [Expanded(child: contentView), rightView],
          ),
        ),
        line,
        errorText
      ],
    );
  }
}
