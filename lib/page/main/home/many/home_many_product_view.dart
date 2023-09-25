import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/many/loan_status_item_view.dart';
import 'package:rapicredito/page/main/home/many/no_order_loan_item_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';

class HomeManyProductView extends GetKeepStateView<MainHomeCtr> {
  const HomeManyProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const MainAppBarView(
            title: 'RapiCrédito',
          ),
          homeManyListView
        ],
      ),
    );
  }

  Widget get homeManyListView => Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
          shrinkWrap: true,
          itemCount: ctr.mainHomeState.dataSource.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildListItemView(index);
          },
        );
      });

  Widget _buildListItemView(int index) {
    var bean = ctr.mainHomeState.dataSource[index];
    var viewStatus = bean.shortHelmetModernLatterGiftedDifference ?? '';
    Widget itemView = const SizedBox.shrink();
    switch (viewStatus) {
      case '0':
        itemView = NoOrderLoanItemView(index: index);
        break;
      default:
        itemView = LoanStatusItemView(index: index);
        break;
    }
    return itemView;
  }
}
