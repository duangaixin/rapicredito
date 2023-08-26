import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_base_controller.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/utils/keyboard_util.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/custom_picker.dart';

class AuthPersonCtr extends BaseGetCtr {
  final state = AuthPersonState();
  TextEditingController emailCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailCtr.addListener(_btnCanClick);
  }

  void _btnCanClick() {
    if (ObjectUtil.isEmptyString(state.income) ||
        ObjectUtil.isEmptyString(state.familyCount) ||
        ObjectUtil.isEmptyString(state.educationalLevel) ||
        ObjectUtil.isEmptyString(emailCtr.text)) {
      state.btnDisableClick = true;
    } else {
      state.btnDisableClick = false;
    }
  }

  void showSelectDialog(PersonClickType clickType) {
    KeyboardUtils.unFocus();
    List realList = ['1', '2', '3', '4'];
    dynamic selectData = '1';
    if (clickType == PersonClickType.incomeType) {
    } else if (clickType == PersonClickType.familyCount) {
    } else if (clickType == PersonClickType.educationalLevel) {}

    CustomPicker.showSinglePicker(Get.context!, data: realList,
        onConfirm: (data, p) {
      if (clickType == PersonClickType.incomeType) {
        state.income = data;
      } else if (clickType == PersonClickType.familyCount) {
        state.familyCount = data;
      } else if (clickType == PersonClickType.educationalLevel) {
        state.educationalLevel = data;
      }
      _btnCanClick();
    }, selectData: selectData);
  }
}

enum PersonClickType {
  incomeType,
  familyCount,
  educationalLevel,
}
