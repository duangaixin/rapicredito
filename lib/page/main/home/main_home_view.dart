import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/many/home_many_product_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_audit_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_deal_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_default_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_failure_view.dart';
import 'package:rapicredito/page/main/home/widget/home_loan_making_repayment_view.dart';
import 'package:rapicredito/page/main/home/widget/home_refusal_to_lend_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainHomePage extends GetKeepStateView<MainHomeCtr> {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PullToRefreshView(
          ctr.refreshController,
          onRefresh: ctr.refreshInfo,
          enablePullUp: false,
          child: LoadContainerView(
              onReload: ctr.refreshInfo,
              loadState: ctr.state.loadState,
              contentView: HomeLoanMakingRepaymentView()
              // contentView: HomeLoanDefaultView()
              // contentView: ctr.state.originNetList.length > 1
              //     ? HomeManyProductView()
              //     : HomeLoanDefaultView(),
              //    contentView:  HomeLoanFailureView(),
              //  contentView: omeLoanDealView(),
              //   contentView:  HomeLoanAuditView()
              //  contentView: HomeRefusalToLendView()
              ),
        );
      }),
    );
  }
}
