import 'package:flutter/material.dart';
import 'package:flutter_pickers/more_pickers/init_data.dart';
import 'package:flutter_pickers/more_pickers/route/single_picker_route.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/style/picker_style.dart';

class CustomPicker {
  static void showSinglePicker(BuildContext context,
      {required dynamic data,
      dynamic selectData,
      String? suffix,
      PickerStyle? pickerStyle,
      SingleCallback? onChanged,
      SingleCallback? onConfirm,
      Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    assert((data is List) || (data is PickerDataType),
        'params : data must List or PickerDataType');

    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    Navigator.of(context, rootNavigator: overlapTabBar).push(SinglePickerRoute(
      data: data,
      suffix: suffix,
      selectData: selectData,
      pickerStyle: pickerStyle,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }
}
