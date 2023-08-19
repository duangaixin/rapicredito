import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainOrderPage extends GetKeepStateView<MainOrderCtr> {
  const MainOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(() {
        return LoadContainerView(
            contentView: PullToRefreshView(
              ctr.refreshController,
              onRefresh: ctr.refreshInfo,
              enablePullUp: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: const [],
                ),
              ),
            ),
            loadState: ctr.state.loadState);
      })
    );
  }
}
