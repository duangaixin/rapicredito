import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/model/order_info_bean.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/page/main/order/widget/order_empty_view.dart';
import 'package:rapicredito/page/main/order/widget/order_loan_again_view.dart';
import 'package:rapicredito/page/main/order/widget/order_loan_failed_view.dart';
import 'package:rapicredito/page/main/order/widget/order_loan_rejection_view.dart';
import 'package:rapicredito/page/main/order/widget/order_overdue_view.dart';
import 'package:rapicredito/page/main/order/widget/order_repayment_review_view.dart';
import 'package:rapicredito/page/main/order/widget/order_under_review_view.dart';
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
            child: contentView,
          ),
          emptyView: const OrderEmptyView(),
          loadState: ctr.state.loadState);
    }));
  }

  Widget get contentView => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const MainAppBarView(
              title: 'RapiCrédito',
            ),
            orderListView
          ],
        ),
      );

  Widget get orderListView => ListView.builder(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
        shrinkWrap: true,
        //   itemCount: ctr.state.dataSource.length,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildListItemView(index);
        },
      );

  Widget _buildListItemView(int index) {
    OrderInfoBean orderInfoBean = ctr.state.dataSource[index];
    var viewStatus =
        orderInfoBean.shortHelmetModernLatterGiftedDifference ?? '';
    Widget itemView = const SizedBox.shrink();
    switch (viewStatus) {
      case '0':

        ///审核中
        itemView = OrderUnderReviewView(bean: orderInfoBean);

        break;
      case '1':

        ///拒绝
        itemView = OrderLoanRejectionView(bean: orderInfoBean);
        break;
      case '2':

        ///订单完成
        itemView = OrderLoanAgainView(bean: orderInfoBean);
        break;
      case '3':

        ///逾期中
        itemView = OrderOverdueView(bean: orderInfoBean);
        break;
      case '4':

        ///还款中
        itemView = OrderRepaymentView(bean: orderInfoBean);
        break;
      case '5':

        ///放款失败
        itemView = OrderLoanFailedView(bean: orderInfoBean);
        break;
      case '6':

        ///放款处理中
        break;
    }
    return itemView;
  }
}
