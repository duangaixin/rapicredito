import 'package:rapicredito/get/getx_router_auth.dart';
import 'package:rapicredito/page/auth/contact/index.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/login/register/index.dart';
import 'package:rapicredito/page/main/app_main_bindings.dart';
import 'package:rapicredito/page/main/app_main_view.dart';
import 'package:rapicredito/page/notfound/not_found_page.dart';
import 'package:rapicredito/page/splash/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/route_manager.dart';

class PageRouterManage {
  static const initial = PageRouterName.splashPage;

  static final List<GetPage> routes = [
    GetPage(
        name: PageRouterName.initial,
        page: () => const SplashPage(),
        binding: SplashBinding(),
        middlewares: [RouteSplashMiddleware()]),
    GetPage(
        name: PageRouterName.mainPage,
        page: () => const AppMainPage(),
        binding: AppMainBinding()),
    GetPage(
        name: PageRouterName.authPersonPage,
        page: () => const AuthPersonPage(),
        binding: AuthPersonBinding()),
    GetPage(
        name: PageRouterName.registerPage,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: PageRouterName.authContactPage,
        page: () => const AuthContactPage(),
        binding: AuthContactBinding()),
    GetPage(
        name: PageRouterName.authIdPage,
        page: () => const AuthIdPage(),
        binding: AuthIdBinding()),
    GetPage(
        name: PageRouterName.notFoundPage, page: () => const NotFoundPage()),
  ];
}
