import 'package:flutter/material.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/many/available_loan_item_view.dart';
import 'package:rapicredito/page/main/home/many/loan_status_item_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';

class HomeManyProductView extends GetKeepStateView<MainHomeCtr> {
  const HomeManyProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return contentView;
  }

  Widget get contentView => SingleChildScrollView(
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

  Widget get homeManyListView => ListView.builder(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
        shrinkWrap: true,
        itemCount: ctr.state.originNetList.length,
      //  itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildListItemView(index);
        },
      );

  Widget _buildListItemView(int index) {
    var viewStatus = '';
    Widget itemView = const SizedBox.shrink();
    switch (index.toString()) {
      case '0':
        itemView = LoanStatusItemView();
        break;
      case '1':
        itemView = LoanStatusItemView();
        break;
      case '2':
        itemView = LoanStatusItemView();
        break;
      case '3':
        itemView = LoanStatusItemView();
        break;
      case '4':
        itemView = AvailableLoanView();
        break;
      case '5':
        itemView = AvailableLoanView();
        break;
      case '6':
        itemView = AvailableLoanView();
        break;
    }
    return itemView;
  }
}
