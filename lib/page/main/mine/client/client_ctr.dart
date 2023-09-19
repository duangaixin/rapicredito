import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/page/main/mine/client/index.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/load_container_view.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
      state.tip = clientInfoBean?.aggressiveExamUsedBackStove ?? '';
      var modelList = clientInfoBean?.stillEmbassyVillagerReviewer ?? [];
      var whatAppList =
          clientInfoBean?.busyChimneyLiquidStadiumRectangleArithmetic ?? [];
      var emailList = clientInfoBean?.firmHeadteacherThoseMadamSecret ?? [];

      if (!ObjectUtil.isEmptyList(modelList)) {
        var clientListBean =
            ClientListBean(title: 'Teléfono', type: '1', itemList: modelList);
        state.dataSource.add(clientListBean);
      }
      if (!ObjectUtil.isEmptyList(modelList)) {
        var clientListBean =
            ClientListBean(title: 'Whatsapp', type: '2', itemList: whatAppList);
        state.dataSource.add(clientListBean);
      }
      if (!ObjectUtil.isEmptyList(modelList)) {
        var clientListBean = ClientListBean(
            title: 'Correo electrónico', type: '3', itemList: emailList);
        state.dataSource.add(clientListBean);
      }
      state.loadState = LoadState.succeed;
    } else {
      //  state.loadState = LoadState.failed;
      NetException.dealAllException(response);
    }
  }

  void callPhone(String phoneNumber) async {
    Uri url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      await copyStr(phoneNumber);
    } else {
      ProgressHUD.showError('Fracaso al abrir el enlace');
    }
  }

  void jumpWhatsapp(String phone) async {
    Uri url = Uri.parse('https://api.whatsapp.com/send?phone=$phone');
    await launchUrl(url);
    await copyStr(phone);
  }

  void sendEmail(String email) async {
    Uri url = Uri.parse('mailto:$email');
    await launchUrl(url);
    await copyStr(email);
  }

  Future<void> copyStr(String str) async {
    await Clipboard.setData(ClipboardData(text: str));
    ProgressHUD.showSuccess('Copiar con éxito');
  }
}
