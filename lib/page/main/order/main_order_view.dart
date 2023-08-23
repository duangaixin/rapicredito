import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/mine/widget/input_dialog.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/page/splash/widget/permission_dialog.dart';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  CustomButton(
                      text: '输入弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return Dialog(
                                child: InputDialog(
                                  clickConfirm: (String s) {},
                                ),
                              );
                            });
                      }),
                  CustomButton(
                      text: '权限弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return Dialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                insetPadding: const EdgeInsets.only(
                                    top: 79.0,
                                    bottom: 70.0,
                                    left: 10.0,
                                    right: 10.0),
                                child: PermissionDialog(
                                  leftClickConfirm: () {},
                                  rightClickConfirm: () {},
                                ),
                              );
                            });
                      }),
                  CustomButton(
                      text: '底部弹窗',
                      onPressed: () {
                        CustomPicker.showSinglePicker(context,
                            data: ['1', '2', '3', '4']);
                      }),
                  CustomButton(
                      text: '个人信息',
                      onPressed: () {
                        Get.toNamed(PageRouterName.authPersonPage);
                      }),
                  CustomButton(
                      text: '联系人信息',
                      onPressed: () {
                        Get.toNamed(PageRouterName.authContactPage);
                      }),
                  CustomButton(
                      text: '身份认证信息',
                      onPressed: () {
                        Get.toNamed(PageRouterName.authIdPage);
                      }),
                  CustomButton(
                      text: '注册',
                      onPressed: () {
                        Get.toNamed(PageRouterName.registerPage);
                      }),
                  CustomButton(
                      text: '更换银行卡',
                      onPressed: () {
                        Get.toNamed(PageRouterName.selectBankPage);
                      }),
                  CustomButton(
                      text: '客服',
                      onPressed: () {
                        Get.toNamed(PageRouterName.clientPage);
                      }),
                  CustomButton(
                      text: '首贷单金额单期限',
                      onPressed: () {
                        Get.toNamed(PageRouterName.firstLoanPage);
                      }),
                ],
              ),
            ),
          ),
          loadState: ctr.state.loadState);
    }));
  }
}
