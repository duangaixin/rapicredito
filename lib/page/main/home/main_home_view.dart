import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_deal_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_default_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_failure_view.dart';
import 'package:rapicredito/page/main/home/widget/home_refusal_to_lend_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainHomePage extends GetKeepStateView<MainHomeCtr> {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return LoadContainerView(
            contentView: PullToRefreshView(ctr.refreshController,
                onRefresh: ctr.refreshInfo,
                enablePullUp: false,
                //  child: HomeLoanDefaultView(),
                // child: HomeLoanFailureView(),
                //   child: HomeLoanDealView(),
                child: HomeRefusalToLendView()),
            loadState: ctr.state.loadState);
      }),
    );
  }
}
