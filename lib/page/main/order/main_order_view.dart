import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  CustomButton(
                      text: '设置页面',
                      onPressed: () {
                        Get.toNamed(PageRouterName.settingPage);
                      }),
                  CustomButton(
                      text: '客服',
                      onPressed: () {
                        Get.toNamed(PageRouterName.clientPage);
                      }),
                  CustomButton(
                      text: '展期还款成功',
                      onPressed: () {
                        Get.toNamed(PageRouterName.rolloverPaymentResultPage);
                      }),

                  CustomButton(
                      text: '提交成功弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return CommitSuccessDialog(
                                clickConfirm: () {},
                              );
                            });
                      }),
                  CustomButton(
                      text: '支付弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return PayDialog(
                                clickConfirm: () {},
                              );
                            });
                      }),
                  CustomButton(
                      text: '日期选择弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return DateSelectDialog(
                                clickConfirm: () {},
                              );
                            });
                      }),
                  CustomButton(
                      text: '金额确认弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return LoanConfirmMoneyDialog(
                                clickConfirm: (String s) {},
                              );
                            });
                      }),
                  CustomButton(
                      text: '输入弹窗',
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return MessageInputDialog(
                                clickConfirm: (String s) {},
                              );
                            });
                      }),
                  // CustomButton(
                  //     text: '权限弹窗',
                  //     onPressed: () {
                  //       showDialog(
                  //           context: context,
                  //           barrierDismissible: false,
                  //           builder: (_) {
                  //             return Dialog(
                  //               shape: const RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.all(
                  //                   Radius.circular(16.0),
                  //                 ),
                  //               ),
                  //               insetPadding: const EdgeInsets.only(
                  //                   top: 79.0,
                  //                   bottom: 70.0,
                  //                   left: 10.0,
                  //                   right: 10.0),
                  //               child: PermissionDialog(
                  //                 leftClickConfirm: () {},
                  //                 rightClickConfirm: () {},
                  //               ),
                  //             );
                  //           });
                  //     }),
                  CustomButton(
                      text: '权限页面',
                      onPressed: () {
                        Get.toNamed(PageRouterName.permissionPage);
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
                      text: '登录',
                      onPressed: () {
                        Get.toNamed(PageRouterName.loginPage);
                      }),
                  CustomButton(
                      text: '添加银行卡',
                      onPressed: () {
                        Get.toNamed(PageRouterName.addAccountPage);
                      }),
                  CustomButton(
                      text: '更新银行卡',
                      onPressed: () {
                        Get.toNamed(PageRouterName.updateAccountPage);
                      }),

                  CustomButton(
                      text: '首贷单金额单期限',
                      onPressed: () {
                        Get.toNamed(PageRouterName.loanDatePage);
                      }),
                ],
              ),
            ),
          ),
          loadState: ctr.state.loadState);
    }));
  }
}
