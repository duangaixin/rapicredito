import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/json/upload_json_manage.dart';
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
    if (UserStore.to.hasToken || index == 0) {
      pageController.jumpToPage(index);
    } else {
      if (index != 0) {
        Get.toNamed(PageRouterName.loginPage);
      }
    }
  }

  void dealPageChanged(int index) {
    state.pageIndex = index;
    if (state.pageIndex == 0) {
      var homeCtr = Get.find<MainHomeCtr>();
      homeCtr.requestInitData();
    } else if (state.pageIndex == 1) {
      if (UserStore.to.hasToken) {
        var orderCtr = Get.find<MainOrderCtr>();
        orderCtr.requestInitData();
      }
    } else if (state.pageIndex == 2) {
      if (UserStore.to.hasToken) {
        var mineCtr = Get.find<MainMineCtr>();
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

  Future<String> postQueryIsNeedUploadJsonRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response =
        await HttpRequestManage.instance.postIsNeedUploadBigJson(param);
    if (response.isSuccess()) {
      var status = response.data ?? '';
      return status;
    } else {
      NetException.toastException(response);
      return Future.value('');
    }
  }

  Future<void> postUploadJsonRequest() async {
    var bean = await UploadJsonManage.instance.collectAllData();
    var jsonStr = json.encode(bean);
    print(jsonStr);
    Map<String, dynamic> param = getCommonParam();
    var response = await HttpRequestManage.instance.postUploadBigJson(param);
    if (response.isSuccess()) {
    } else {
      NetException.toastException(response);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
