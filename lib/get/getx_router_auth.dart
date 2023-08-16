import 'package:flutter/material.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/get.dart';


class RouteAuthMiddleware extends GetMiddleware {
  RouteAuthMiddleware();

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == PageRouterName.loginPage) {
      return null;
    } else {
      return const RouteSettings(name: PageRouterName.loginPage);
    }
  }
}
