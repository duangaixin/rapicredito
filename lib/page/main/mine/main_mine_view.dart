import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/mine/widget/common_setting_click_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainMinePage extends GetKeepStateView<MainMineCtr> {
  const MainMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return LoadContainerView(
          contentView: PullToRefreshView(
            ctr.refreshController,
            onRefresh: ctr.refreshInfo,
            enablePullUp: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const MainAppBarView(), headerView, contentView],
              ),
            ),
          ),
          loadState: ctr.state.loadState);
    }));
  }

  Widget get headerView => Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 16.0, right: 16.0, bottom: 26.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 23.0, left: 7.0),
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.5),
                  color: const Color(0xffB6EF13)),
            ),
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ronald Lamb',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xff333333)),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      '+57 954-566670',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff333333),
                      ),
                    ))
              ],
            ))
          ],
        ),
      );

  Widget get contentView => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 18.0),
              height: 1.0,
              width: double.infinity,
              color: const Color(0xffE9E9E9),
            ),
            CommonSettingClickView(
              iconHeight: 22.0,
              iconWith: 23.49,
              iconPath: Resource.assetsImageAuthFace,
              onTap: () {},
              content: 'Ajuste',
            ),
            CommonSettingClickView(
              iconHeight: 25.0,
              iconWith: 25.0,
              iconPath: Resource.assetsImageAuthFace,
              onTap: () {},
              content: 'Servicio al Cliente',
            ),
            CommonSettingClickView(
              iconHeight: 21.25,
              iconWith: 21.25,
              iconPath: Resource.assetsImageAuthFace,
              onTap: () {},
              content: 'Avisos de Privacidad',
            ),
            CommonSettingClickView(
              iconHeight: 21.6,
              iconWith: 20.25,
              iconPath: Resource.assetsImageAuthFace,
              onTap: () {},
              content: 'Servicio al cliente en línea',
            ),
            CommonSettingClickView(
              iconHeight: 25.0,
              iconWith: 19.0,
              iconPath: Resource.assetsImageAuthFace,
              onTap: () {},
              content: 'Atención al cliente',
            ),
          ],
        ),
      );
}
