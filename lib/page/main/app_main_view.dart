import 'package:flutter/material.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/order/index.dart';

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
      controller: controller.pageController,
      onPageChanged: controller.dealPageChanged,
      children: const <Widget>[MainHomePage(), MainOrderPage(), MainMinePage()],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabList,
          currentIndex: controller.state.pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: controller.dealNavBarTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
