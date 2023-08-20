import 'package:flutter/material.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CommonSettingClickView extends StatelessWidget {
  const CommonSettingClickView(
      {Key? key,
      this.onTap,
      this.content = '',
      this.iconPath = '',
      this.iconHeight = 25.0,
      this.iconWith = 25.0,
      this.canClick = true})
      : super(key: key);

  final VoidCallback? onTap;
  final String content;
  final bool canClick;
  final double iconWith;
  final double iconHeight;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 15.0),
          child: CustomImageView(
            iconPath,
            imageType: ImageType.assets,
            width: iconWith,
            height: iconHeight,
          ),
        ),
        Expanded(
          child: Text(content,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 18.0, color: Color(0xff333333))),
        ),
        const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.chevron_right,
                size: 17.0, color: Color(0xff6A6A6A))),
      ],
    );
    return CustomClickView(
      onTap: canClick ? onTap : null,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          constraints: const BoxConstraints(minHeight: 62.0),
          width: double.infinity,
          child: child),
    );
  }
}
