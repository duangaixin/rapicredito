import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/page/main/mine/client/index.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class ClientCtr extends BaseGetCtr {
  final state = ClientState();

  @override
  void onReady() {
    _postQueryClientInfoRequest();
    super.onReady();
  }

  void _postQueryClientInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    Get.showLoading();
    var response =
        await HttpRequestManage.instance.postQueryClientInfoRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var clientInfoBean = response.data;
      var modelList = clientInfoBean?.stillEmbassyVillagerReviewer ?? [];
      var whatAppList =
          clientInfoBean?.busyChimneyLiquidStadiumRectangleArithmetic ?? [];
      var emailList = clientInfoBean?.firmHeadteacherThoseMadamSecret ?? [];

      if (!ObjectUtil.isEmptyList(modelList)) {
        var clientListBean =
            ClientListBean(title: 'Teléfono', itemList: modelList);
        state.dataSource.add(clientListBean);
      }
      if (!ObjectUtil.isEmptyList(modelList)) {
        var clientListBean =
            ClientListBean(title: 'Whatsapp', itemList: whatAppList);
        state.dataSource.add(clientListBean);
      }
      if (!ObjectUtil.isEmptyList(modelList)) {
        var clientListBean =
            ClientListBean(title: 'Correo electrónico', itemList: emailList);
        state.dataSource.add(clientListBean);
      }
      state.loadState = LoadState.succeed;
    } else {
      state.loadState = LoadState.failed;
      NetException.toastException(response);
    }
  }
}
