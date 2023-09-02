import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/json/upload_json_manage.dart';
import 'package:rapicredito/page/dialog/commit_success_dialog.dart';
import 'package:rapicredito/page/dialog/date_select_dialog.dart';
import 'package:rapicredito/page/dialog/message_input_dialog.dart';
import 'package:rapicredito/page/dialog/pay_dialog.dart';
import 'package:rapicredito/page/loan/widget/loan_confirm_money_dialog.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_picker.dart';
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
            child: Container(),
          ),
          loadState: ctr.state.loadState);
    }));
  }
}
