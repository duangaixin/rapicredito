import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/index.dart';
import 'package:rapicredito/style/index.dart';


class AppMainCtr extends BaseGetCtr{
  AppMainCtr();


  late final PageController pageController;

  late final List<BottomNavigationBarItem> bottomTabList;

  final state = AppMainState();

  void dealNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  void dealPageChanged(int index) {
    state.pageIndex = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.pageIndex);
    bottomTabList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Image.asset( Resource.assetsImagesMainOne, width: 25.0),
        activeIcon: Image.asset(
          Resource.assetsImagesMainOne,
          color: Color(0xff666666),
          width: 25.0,
        ),
          label: ''
      ),
      BottomNavigationBarItem(
        icon: Image.asset(Resource.assetsImagesMainTwo, width: 25.0),
        activeIcon: Image.asset(
          Resource.assetsImagesMainTwo,
          color: Color(0xff666666),
          width: 25.0,
        ),
          label: ''
      ),
      BottomNavigationBarItem(
        icon: Image.asset( Resource.assetsImagesMainThree, width: 25.0),
        activeIcon: Image.asset(
          Resource.assetsImagesMainThree,
          color: Color(0xff666666),
          width: 25.0,
        ),
        label: ''
      ),
    ];
  }

  @override
  void onReady() {
    super.onReady();

    var isFirstEnter = StorageService.to.getBool(AppConstants.isFirstStartKey);
    if (!isFirstEnter) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _showPrivacyDialog();
      });
    } else {
      _checkUpdate();
    }
  }


  void _checkUpdate() {
    var isLogin = UserStore.to.isLogin;
    if (!isLogin) return;
    var param = <String, dynamic>{};

  }

  void _showPrivacyDialog() {

  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
