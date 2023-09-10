import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class MainHomeCtr extends BaseGetCtr {
  MainHomeCtr();

  final state = MainHomeState();
  var refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    requestInitData();
  }

  void requestInitData() async {
    if(UserStore.to.hasToken){
      await _postQueryOrderInfoRequest();
    }else{
      state.loanStatus=-1;
      await postQueryHomeDefaultInfoRequest();
    }

    // await postIsHomeManyProductRequest();
    // if (state.originNetList.length == 1) {
    //   await postQueryHomeDefaultInfoRequest();
    // } else {
    //   state.loadState = LoadState.succeed;
    // }
    if (state.isRefresh) {
      refreshController.refreshCompleted();
    }
  }

  void goToAuthPage() {
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.authPersonPage);
  }

  void refreshInfo() {
    state.isRefresh = true;
    requestInitData();
  }

  Future<void> _postQueryOrderInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    var response = await HttpRequestManage.instance.postOrderInfo(param);
    if (response.isSuccess()) {
      var bean = response.data;
      state.overdueStatus = bean?.centralTechnologyAboveCarefulTomato ?? -1;
      state.loanStatus = bean?.federalDirectorySituation ?? -1;
      state.overdueStatus=2;
      state.loanStatus=2;

      state.creditAmount=bean?.sharpStrictRelationship??0.0;
      state.applyDate=bean?.valuableRussianForestCop??'';
      if(state.overdueStatus==-1){
        await postQueryHomeDefaultInfoRequest();
      }else {
       state.loadState=LoadState.succeed;
      }
    } else {
      state.loadState=LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  Future<void> postQueryHomeDefaultInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    param['crazyPeopleReadyBravery'] = 'cleverMaidActualFoot';
    var response = await HttpRequestManage.instance.postAppSettingInfo(param);
    if (response.isSuccess()) {
      var bean = response.data;
      state.maxAmount = bean?.cleverMaidActualFoot ?? '--';
      state.loadState = LoadState.succeed;
    } else {
      state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  void goToChangeAccountPage(){
    KeyboardUtils.unFocus();
    Get.toNamed(PageRouterName.changeAccountPage);
  }



  // Future<void> postIsHomeManyProductRequest() async {
  //   Map<String, dynamic> param = getCommonParam();
  //   var response =
  //       await HttpRequestManage.instance.postIsHomeManyProductRequest(param);
  //   if (response.isSuccess()) {
  //     var netList = response.data ?? [];
  //     if (!ObjectUtil.isEmptyList(netList)) {
  //       state.originNetList
  //         ..clear()
  //         ..addAll(netList);
  //       if (state.originNetList.length > 1) {
  //         for (int i = 0; i < state.originNetList.length; i++) {
  //           var bean = state.originNetList[i];
  //           var status = bean.shortHelmetModernLatterGiftedDifference ?? '0';
  //           if (status == '0') {
  //             state.notPlaceOrderList.add(bean);
  //           } else {
  //             state.otherOrderList.add(bean);
  //           }
  //           if (!ObjectUtil.isEmptyList(state.otherOrderList)) {
  //             state.dataSource.addAll(state.otherOrderList);
  //           }
  //
  //           if (!ObjectUtil.isEmptyList(state.otherOrderList)) {}
  //         }
  //       }
  //     }
  //   } else {
  //     state.loadState = LoadState.failed;
  //     NetException.dealAllException(response);
  //   }
  // }
}
