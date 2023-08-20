import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainMinePage extends GetKeepStateView<MainMineCtr> {
  const MainMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return LoadContainerView(
            contentView: PullToRefreshView(
              ctr.refreshController,
              onRefresh: ctr.refreshInfo,
              enablePullUp: false,
              child:  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children:  [
                    MainAppBarView()
                  ],
                ),
              ),
            ),
            loadState: ctr.state.loadState);
      })
    );
  }



}
