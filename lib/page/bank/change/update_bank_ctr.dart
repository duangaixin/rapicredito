import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/bank/change/index.dart';
import 'package:rapicredito/widget/custom_picker.dart';

class UpdateBankCtr extends BaseGetCtr {
  final state = UpdateBankState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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
