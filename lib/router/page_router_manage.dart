import 'package:rapicredito/page/main/app_main_bindings.dart';
import 'package:rapicredito/page/main/app_main_view.dart';
import 'package:rapicredito/page/notfound/not_found_page.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/route_manager.dart';


class PageRouterManage {
  static const initial = PageRouterName.homePage;

  static final List<GetPage> routes = [
    GetPage(
      name: PageRouterName.initial,
      page: () => const NotFoundPage(),
    ),
    GetPage(
      name: PageRouterName.homePage,
      page: () => const AppMainPage(),
      binding: AppMainBinding()
    ),
  ];
}
