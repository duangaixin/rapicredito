import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CommonAuthAgreeView extends GetView<MainHomeCtr> {
  const CommonAuthAgreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              Resource.assetsImageMainOne,
              imageType: ImageType.assets,
              width: 18.0,
              height: 15.0,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                Strings.autoLineString(
                    'Todos los datos que rellene serán tratados correctamente y nunca revelarán su información personal.'),
                style: TextStyle(fontSize: 13.0, color: Color(0xff666666)),
              ),
            ))
          ],
        ),
        CommonAgreeView()
      ],
    );
  }
}
