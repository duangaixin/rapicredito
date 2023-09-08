import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class OrderEmptyView extends GetView<MainOrderCtr> {
  const OrderEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          //controller.refreshInfo(isShowDialog: true);
        },
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MainAppBarView(
              title: 'RapiCrédito',
            ),
            CustomImageView(
              Resource.assetsImageOrderEmpty,
              imageType: ImageType.assets,
              width: 96.0,
              height: 94.0,
              margin: EdgeInsets.only(top: 65.0, bottom: 37.0),
              fit: BoxFit.cover,
            ),
            Text(
              'No se concentric orden relacionado',
              style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
            )
          ],
        ),
      ),
    );
  }
}
