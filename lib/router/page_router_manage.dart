import 'package:rapicredito/get/getx_router_auth.dart';
import 'package:rapicredito/page/account/add/index.dart';
import 'package:rapicredito/page/account/change/index.dart';
import 'package:rapicredito/page/auth/contact/index.dart';
import 'package:rapicredito/page/auth/id/index.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/page/camera/custom_camera_page.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/page/login/index.dart';
import 'package:rapicredito/page/main/app_main_bindings.dart';
import 'package:rapicredito/page/main/app_main_view.dart';
import 'package:rapicredito/page/main/mine/client/index.dart';
import 'package:rapicredito/page/main/mine/setting/index.dart';
import 'package:rapicredito/page/notfound/not_found_page.dart';
import 'package:rapicredito/page/permission/index.dart';
import 'package:rapicredito/page/result/rollover/index.dart';
import 'package:rapicredito/page/splash/index.dart';
import 'package:rapicredito/page/test/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:get/route_manager.dart';
import 'package:rapicredito/webview/webview_page.dart';

class PageRouterManage {
  static const initial = PageRouterName.permissionPage;

  static final List<GetPage> routes = [
    GetPage(
        name: PageRouterName.initial,
        page: () => const PermissionPage(),
        binding: PermissionBinding(),
        middlewares: [RoutePermissionMiddleware()]),
    GetPage(
      name: PageRouterName.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: PageRouterName.mainPage,
        page: () => const AppMainPage(),
        binding: AppMainBinding()),
    GetPage(
        name: PageRouterName.loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: PageRouterName.authPersonPage,
        page: () => const AuthPersonPage(),
        binding: AuthPersonBinding(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: PageRouterName.authContactPage,
        page: () => const AuthContactPage(),
        binding: AuthContactBinding(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: PageRouterName.authIdPage,
        page: () => const AuthIdPage(),
        binding: AuthIdBinding(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
      name: PageRouterName.addAccountPage,
      page: () => const AddAccountPage(),
      binding: AddAccountBinding(),
    ),
    GetPage(
      name: PageRouterName.changeAccountPage,
      page: () => const ChangeAccountPage(),
      binding: ChangeAccountBinding(),
    ),
    GetPage(
        name: PageRouterName.clientPage,
        page: () => const ClientPage(),
        binding: ClientBinding(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: PageRouterName.loanDatePage,
        page: () => const LoanMoneyDatePage(),
        binding: LoanMoneyDateBinding()),
    GetPage(
        name: PageRouterName.rolloverPaymentResultPage,
        page: () => const RolloverPaymentResultPage(),
        binding: RolloverPaymentResultBinding()),
    GetPage(
        name: PageRouterName.settingPage,
        page: () => const SettingPage(),
        binding: SettingBinding()),
    GetPage(
      name: PageRouterName.webViewPage,
      page: () => const WebViewPage(),
    ),
    GetPage(
      name: PageRouterName.customCameraPage,
      page: () => const CustomCameraPage(),
    ),
    GetPage(
        name: PageRouterName.testPage,
        page: () => const TestPage(),
        binding: TestBinding()),
    GetPage(
        name: PageRouterName.notFoundPage, page: () => const NotFoundPage()),
  ];
}
