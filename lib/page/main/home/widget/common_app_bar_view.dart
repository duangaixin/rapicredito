import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class MainAppBarView extends StatefulWidget {
  final String? title;

  const MainAppBarView({Key? key, this.title}) : super(key: key);

  @override
  MainAppBarViewState createState() => MainAppBarViewState();
}

class MainAppBarViewState extends State<MainAppBarView> {
  Widget get leftView => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title ?? '',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colour.text33,
                fontSize: 15,
              )),
        ],
      );

  Widget get rightView => CustomClickView(
        onTap: () {
          Get.toNamed(PageRouterName.clientPage, arguments: {
            AppConstants.fromPageNameKey: PageRouterName.clientPage
          });
        },
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 16.0, left: 5.0),
            child: const CustomImageView(
              Resource.assetsImageHomeTitleAction,
              imageType: ImageType.assets,
              width: 17.81,
              height: 19.0,
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: AppBar(
        titleSpacing: 0,
        title: leftView,
        actions: [rightView],
      ),
    );
  }
}
