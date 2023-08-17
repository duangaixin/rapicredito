import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:rapicredito/config/app_global_config.dart';
import 'package:rapicredito/local/language_store.dart';
import 'package:rapicredito/page/notfound/not_found_page.dart';
import 'package:rapicredito/router/page_router_manage.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/style/index.dart';
import 'package:get/get.dart';

void main() async {
  await AppGlobalConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return GetMaterialApp(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      navigatorKey: Get.key,
      title: 'rapicredito',
      initialRoute: PageRouterName.initial,
      getPages: PageRouterManage.routes,
      builder: (context, child) {
        child = MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      unknownRoute: GetPage(
          name: PageRouterName.notFoundPage, page: () => const NotFoundPage()),
      locale: Message.locale,
      fallbackLocale: Message.fallbackLocale,
      translations: Message(),
    );
  }
}
