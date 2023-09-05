import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:rapicredito/json/upload_json_manage.dart';
import 'package:rapicredito/page/dialog/date_select_dialog.dart';
import 'package:rapicredito/page/dialog/message_input_dialog.dart';
import 'package:rapicredito/page/dialog/pay_dialog.dart';
import 'package:rapicredito/page/loan/widget/commit_success_dialog.dart';
import 'package:rapicredito/page/loan/widget/loan_confirm_money_dialog.dart';
import 'package:rapicredito/page/test/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/custom_picker.dart';

class TestPage extends GetView<TestCtr> {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'test',
        content: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton(
                  text: '爬取数据',
                  onPressed: () async {
                    var bean = await UploadJsonManage.instance.collectAllData();
                    var jsonStr = json.encode(bean);
                    print(jsonStr);
                    // await UploadJsonManage.instance.getGeneralData();
                    //    await UploadJsonManage.instance.getAppListDataInfo();
                    //  await UploadJsonManage.instance.getBatteryStatusInfo();
                    // await UploadJsonManage.instance.getHardwareInfo();
                    // await UploadJsonManage.instance.getLocationInfo();
                    // await UploadJsonManage.instance.getMediaFileCountInfo();
                    // await UploadJsonManage.instance.getNetInfo();
                    //  await UploadJsonManage.instance.getSimCardInfo();
                    //    await UploadJsonManage.instance.getStorageDataInfo();
                    //      await UploadJsonManage.instance.getOtherDataInfo();
                  }),
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
                          return const CommitSuccessDialog();
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
                  text: '添加账户',
                  onPressed: () {
                    Get.toNamed(PageRouterName.addAccountPage);
                  }),
              CustomButton(
                  text: '修改账户',
                  onPressed: () {
                    Get.toNamed(PageRouterName.changeAccountPage);
                  }),
              CustomButton(
                  text: '首贷单金额单期限',
                  onPressed: () {
                    Get.toNamed(PageRouterName.loanDatePage);
                  }),
            ],
          ),
        ));
  }
}
