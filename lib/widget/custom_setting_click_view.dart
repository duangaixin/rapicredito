import 'package:flutter/material.dart';


class SelectAndShowTextView extends StatelessWidget {
  const SelectAndShowTextView(
      {Key? key,
      this.onTap,
      required this.title,
      this.content = '请选择',
      this.textAlign = TextAlign.start,
      this.textShowStyle,
      this.maxLine = 1,
      this.isShowStar = false,
      this.enableEdit = true})
      : super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final TextStyle? textShowStyle;
  final bool isShowStar;
  final int maxLine;
  final bool enableEdit;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      children: <Widget>[
        Opacity(
          opacity: isShowStar ? 1.0 : 0.0,
          child: const Text(
            '*',
            style: TextStyle(color: Colors.red, fontSize: 16.0),
          ),
        ),
        Text(title, ),

        Expanded(
          child: Text(content,
              maxLines: maxLine,
              textAlign: textAlign,
              overflow: TextOverflow.ellipsis,
              style: content.contains('请选择')
                  ? const TextStyle(
                      fontSize:16.0, )
                  : textShowStyle),
        ),

        Offstage(
            offstage: onTap == null,
            child:
                Icon(Icons.chevron_right, size: 18.0, color: Colors.grey[500]))
      ],
    );
    return GestureDetector(
      onTap: enableEdit ? onTap : null,
      child: Container(
          constraints: const BoxConstraints(minHeight: 48.0),
          width: double.infinity,
          child: child),
    );
  }
}
