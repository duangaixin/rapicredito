import 'package:flutter/material.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  var  pageName='';
  RouteAuthMiddleware();
  @override
  GetPage? onPageCalled(GetPage? page) {
     pageName=page!.name;
    return super.onPageCalled(page);
  }
  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == PageRouterName.loginPage) {
      return null;
    } else {
      return const RouteSettings(name: PageRouterName.loginPage);
    }
  }
}

class RouteSplashMiddleware extends GetMiddleware {
  RouteSplashMiddleware();

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isFirstStart == false) {
      return null;
    } else {
      return const RouteSettings(name: PageRouterName.mainPage);
    }
  }
}
