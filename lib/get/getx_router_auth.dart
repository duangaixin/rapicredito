import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  var pageName = '';

  RouteAuthMiddleware();

  @override
  GetPage? onPageCalled(GetPage? page) {
    pageName = page!.name;
    return super.onPageCalled(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.hasToken || route == PageRouterName.loginPage) {
      return null;
    } else {
      return const RouteSettings(name: PageRouterName.loginPage);
    }
  }
}
class RoutePermissionMiddleware extends GetMiddleware {
  RoutePermissionMiddleware();

  @override
  RouteSettings? redirect(String? route) {
    var notFirstEnter = StorageService.to.getBool(AppConstants.notFirstStartKey);
    if (notFirstEnter == false) {
      return null;
    } else {
      return const RouteSettings(name: PageRouterName.mainPage);
    }
  }
}