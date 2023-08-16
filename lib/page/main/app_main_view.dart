import 'package:flutter/material.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:get/get.dart';


class AppMainPage extends StatefulWidget {
  const AppMainPage({
    Key? key,
  }) : super(key: key);

  @override
  AppMainPageState createState() => AppMainPageState();
}

class AppMainPageState extends State<AppMainPage> {
  AppMainCtr controller = Get.find<AppMainCtr>();

  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(),
        Container(),
        Container(),
        Container(),
      ],
      controller: controller.pageController,
      onPageChanged: controller.dealPageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabList,
          currentIndex: controller.state.pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: controller.dealNavBarTap,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
