import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CommonAuthTitleView extends StatefulWidget {
  const CommonAuthTitleView({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  CommonAuthTitleViewState createState() => CommonAuthTitleViewState();
}

class CommonAuthTitleViewState extends State<CommonAuthTitleView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomImageView(
          Resource.assetsImageAuthTitleBg,
          imageType: ImageType.assets,
          width: 4.0,
          height: 17.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 18.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
