import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/splash/index.dart';
import 'package:rapicredito/router/page_router_name.dart';

class SplashPage extends GetView<SplashCtr> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Swiper(
      itemCount: controller.state.guideList.length,
      loop: false,
      pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
        color: Color(0xFFE0E0E0),
        activeColor: Colors.black54,
      )),
      itemBuilder: (_, index) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            controller.state.guideList[index],
            fit: BoxFit.cover,
          ),
        );
      },
      onTap: (index) {
        if (index == controller.state.guideList.length - 1) {
          UserStore.to.setAlreadyOpen();
          Get.offNamed(PageRouterName.mainPage);
        }
      },
    ));
  }
}
