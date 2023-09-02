import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/page/main/order/widget/order_overdue_view.dart';
import 'package:rapicredito/page/main/order/widget/order_repayment_review_view.dart';
import 'package:rapicredito/page/main/order/widget/order_under_review_view.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainOrderPage extends GetKeepStateView<MainOrderCtr> {
  const MainOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return LoadContainerView(
          contentView: PullToRefreshView(
            ctr.refreshController,
            onRefresh: ctr.refreshInfo,
            enablePullUp: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const MainAppBarView(
                    title: 'RapiCrédito',
                  ),
                  orderListView
                  // Expanded(child: orderListView)
                ],
              ),
            ),
          ),
          loadState: ctr.state.loadState);
    }));
  }

  Widget get orderListView => ListView.builder(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 0.0),
        shrinkWrap: true,
        //   itemCount: ctr.state.dataSource.length,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildListItemView(index);
        },
      );

  Widget _buildListItemView(int index) {
    return OrderOverdueView();
    return OrderRepaymentView();
    return OrderUnderReviewView();
  }
}
