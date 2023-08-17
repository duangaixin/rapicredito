import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/mine/widget/input_dialog.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainMinePage extends GetKeepStateView<MainMineCtr> {
  const MainMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() {
        return LoadContainerView(
            contentView: PullToRefreshView(
              ctr.refreshController,
              onRefresh: ctr.refreshInfo,
              enablePullUp: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children:  [
                    CustomButton(
                        text: '输入弹窗',
                        onPressed: (){
                      showDialog(context: context,
                          barrierDismissible: false,
                          builder: (_){

                        return Dialog(child: InputDialog(clickConfirm: (String s) {

                        },),);
                      });
                    })
                  ],
                ),
              ),
            ),
            loadState: ctr.state.loadState);
      })),
    );
  }
}
