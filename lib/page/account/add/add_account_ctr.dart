import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/account/add/index.dart';
import 'package:rapicredito/widget/custom_picker.dart';

class AddAccountCtr extends BaseGetCtr {
  final state = AddAccountState();
  TextEditingController walletAccountCtr = TextEditingController();
  TextEditingController walletAccountConfirmCtr = TextEditingController();

  TextEditingController bankAccountCtr = TextEditingController();
  TextEditingController bankAccountConfirmCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clickWalletItemView(int index) {
    state.walletSelectIndex = index;
  }

  void showSelectBankDialog() {
    CustomPicker.showSinglePicker(Get.context!,
        data: state.accountTypeList,
        selectData: state.accountTypeList[state.accountTypeSelectIndex],
        onConfirm: (data, position) {
      if (state.accountTypeSelectIndex != position) {
        state.accountTypeSelectIndex = position;
        if (position == 0) {
          state.bankName = '';
          state.bankType = '';
          bankAccountCtr.text = '';
          bankAccountConfirmCtr.text = '';
        }
      }
    });
  }
}
