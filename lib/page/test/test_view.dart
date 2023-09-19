import 'dart:convert';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/json/upload_json_manage.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/page/dialog/permission_dialog.dart';
import 'package:rapicredito/page/main/home/widget/home_recommend_dialog.dart';
import 'package:rapicredito/page/main/home/widget/home_rollover_repayment_dialog.dart';
import 'package:rapicredito/page/test/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/permission_util.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';

class TestPage extends GetView<TestCtr> {
  const TestPage({super.key});

  Future<void> _addCalendarEvent() async {
    PermissionUtil.checkPermission(
        permissionList: [
          Permission.calendar,
        ],
        onSuccess: () async {
          var repaymentDate = '07-08-2024';
          if (!ObjectUtil.isEmptyString(repaymentDate)) {
            List<String> strList = repaymentDate.split('-');
            int year = int.tryParse(strList[2]) ?? 0;
            int month = 0;
            if (strList[1].startsWith('0')) {
              var monthStr = strList[1].substring(0);
              month = int.tryParse(monthStr) ?? 0;
            } else {
              month = int.tryParse(strList[1]) ?? 0;
            }
            int day = 0;
            if (strList[0].startsWith('0')) {
              var dayStr = strList[0].substring(0);
              day = int.tryParse(dayStr) ?? 0;
            } else {
              day = int.tryParse(strList[0]) ?? 0;
            }
            final Event event = Event(
              title: '测试事件',
              description: '还款',
              location: '',
              // timeZone:'CDT' ,
              startDate: DateTime(year, month, day),
              endDate: DateTime(year, month, day),
              androidParams: const AndroidParams(
                emailInvites: [],
              ),
            );
            await Add2Calendar.addEvent2Cal(event);
          }
        },
        goSetting: () {});
  }
  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'test',
        content: SingleChildScrollView(
          child: Column(
            children: [

              CustomButton(
                  text: '测试日历',
                  onPressed: () async {
                    _addCalendarEvent();
                  }),

              CustomButton(
                  text: '爬取数据',
                  onPressed: () async {
                    var bean = await UploadJsonManage.instance.collectAllData();
                    var jsonStr = json.encode(bean);
                    print(jsonStr+'----');
                  }),
              CustomButton(
                  text: '设置页面',
                  onPressed: () {
                    Get.toNamed(PageRouterName.settingPage);
                  }),
              CustomButton(
                  text: '权限弹窗',
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: Get.context!,
                        builder: (_) {
                          return Dialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            insetPadding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: PermissionDialog(rightClickConfirm: () {}),
                          );
                        });
                  }),
              CustomButton(
                  text: '客服',
                  onPressed: () {
                    Get.toNamed(PageRouterName.clientPage);
                  }),
              CustomButton(
                  text: '未找到',
                  onPressed: () {
                    Get.toNamed(PageRouterName.notFoundPage);
                  }),
              CustomButton(
                  text: '还款成功',
                  onPressed: () {
                    Get.toNamed(PageRouterName.repaymentResultPage);
                  }),
              CustomButton(
                  text: '展期还款成功',
                  onPressed: () {
                    Get.toNamed(PageRouterName.rolloverPaymentResultPage);
                  }),
              CustomButton(
                  text: '展期还款弹窗',
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const HomeRolloverRepaymentDialog();
                        });
                  }),
              CustomButton(
                  text: '推荐弹窗',
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const HomeRecommendDialog();
                        });
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
                    Get.toNamed(PageRouterName.accountPage);
                  }),
              CustomButton(
                  text: '修改账户',
                  onPressed: () {
                    Get.toNamed(PageRouterName.accountPage,
                        arguments: {AppConstants.isFromAddAccountKey: false});
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
