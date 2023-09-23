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
import 'package:rapicredito/page/main/home/widget/home_loan_overdue_view.dart';
import 'package:rapicredito/page/main/home/widget/home_refusal_to_lend_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainHomePage extends GetKeepStateView<MainHomeCtr> {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PullToRefreshView(
        ctr.refreshController,
        onRefresh: ctr.refreshInfo,
        enablePullUp: false,
        child: LoadContainerView(
            onReload: ctr.refreshInfo,
            loadState: ctr.mainHomeState.loadState,
            contentView: Obx(() {
              var length = ctr.mainHomeState.dataSource.length;
              return length > 1
                  ? const HomeManyProductView()
                  : Obx(() {
                      var overdueStatus = ctr.mainHomeState.overdueStatus;
                      Widget homeShowView = const HomeLoanDefaultView();
                      if (overdueStatus == 0) {
                        homeShowView = const HomeLoanMakingRepaymentView();
                      } else if (overdueStatus == 1) {
                        homeShowView = const HomeLoanOverdueView();
                      } else if (overdueStatus == 3) {
                        homeShowView = const HomeRefusalToLendView();
                      } else if (overdueStatus == 2) {
                        var loanStatus = ctr.mainHomeState.loanStatus;
                        if (loanStatus == 2) {
                          homeShowView = const HomeLoanFailureView();
                        } else if (loanStatus == 3) {
                          homeShowView = const HomeLoanDealView();
                        } else {
                          homeShowView = const HomeLoanAuditView();
                        }
                      }
                      return homeShowView;
                    });
            })),
      );
    }));
  }
}
