import 'package:get/get.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/http/net_exception.dart';
import 'package:rapicredito/page/account/change/index.dart';

import 'package:rapicredito/widget/custom_picker.dart';

class UpdateAccountCtr extends BaseGetCtr {
  final state = UpdateAccountState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void _postQueryBankInfoRequest() async {
    Map<String, dynamic> param = getCommonParam();
    Get.showLoading();
    var response = await HttpRequestManage.instance.postQueryBankRequest(param);
    Get.dismiss();
    if (response.isSuccess()) {
      var bankList = response.data;
    } else {
      NetException.toastException(response);
    }
  }

  void clickWalletItemView(int index){
    state.walletSelectIndex=index;
  }


  void showSelectBankDialog() {
    CustomPicker.showSinglePicker(Get.context!, data: state.bankList,
        selectData: state.bankList[state.bankSelectIndex],
        onConfirm: (data, position) {
      state.bankSelectIndex = position;
    });
  }
}
