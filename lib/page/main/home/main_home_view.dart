import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/home_default_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainHomePage extends GetKeepStateView<MainHomeCtr> {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
      title: 'RapiCredito',
      isShowBackBtn: false,
      content: Obx(() {
        return LoadContainerView(
            contentView: PullToRefreshView(
              ctr.refreshController,
              onRefresh: ctr.refreshInfo,
              enablePullUp: false,
              child: Container(
                padding: const EdgeInsets.only(left: 14.0,right: 16.0),
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      HomeDefaultView()
                    ],
                  ),
                ),
              ),
            ),
            loadState: ctr.state.loadState);
      }),
    );
  }
}
