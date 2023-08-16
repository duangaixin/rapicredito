import 'package:rapicredito/page/notfound/not_found_page.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/route_manager.dart';


class PageRouterManage {
  static const initial = PageRouterName.initial;

  static final List<GetPage> routes = [
    GetPage(
      name: PageRouterName.initial,
      page: () => const NotFoundPage(),
    ),
  ];
}
