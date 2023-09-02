import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/style/index.dart';

class AppMainCtr extends BaseGetCtr {
  AppMainCtr();

  late final PageController pageController;

  late final List<BottomNavigationBarItem> bottomTabList;

  final state = AppMainState();

  void dealNavBarTap(int index) {
    if (UserStore.to.hasToken) {
      pageController.jumpToPage(index);
    } else {
      Get.toNamed(PageRouterName.loginPage);
    }
  }

  void dealPageChanged(int index) {
    state.pageIndex = index;
    if (state.pageIndex == 0) {
      var homeCtr = Get.find<MainHomeCtr>();
      homeCtr.refreshInfo();
    } else if (state.pageIndex == 1) {
      var orderCtr = Get.find<MainOrderCtr>();
      orderCtr.refreshInfo();
    } else if (state.pageIndex == 2) {
      var mineCtr = Get.find<MainMineCtr>();
      if (UserStore.to.hasToken) {
        mineCtr.refreshInfo();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.pageIndex);
    bottomTabList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Image.asset(Resource.assetsImageMainOne, width: 25.0),
          activeIcon: Image.asset(
            Resource.assetsImageMainOneSelected,
            width: 25.0,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Image.asset(Resource.assetsImageMainTwo, width: 25.0),
          activeIcon: Image.asset(
            Resource.assetsImageMainTwoSelected,
            width: 25.0,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Image.asset(Resource.assetsImageMainThree, width: 25.0),
          activeIcon: Image.asset(
            Resource.assetsImageMainThreeSelected,
            width: 25.0,
          ),
          label: ''),
    ];
  }

  @override
  void onReady() {
    super.onReady();
    var isFirstEnter = StorageService.to.getBool(AppConstants.isFirstStartKey);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
