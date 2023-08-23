import 'package:flutter/material.dart';
import 'package:flutter_pickers/more_pickers/init_data.dart';
import 'package:flutter_pickers/more_pickers/route/single_picker_route.dart';
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
    pickerStyle ??= customizeStyle();
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

PickerStyle customizeStyle() {
  Widget cancelButton = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Cerrar',
      style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
    ),
  );

  Widget commitButton = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Confirmar',
      style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
    ),
  );

  Decoration headDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)));

  return PickerStyle(
      pickerHeight: 159,
      pickerTitleHeight: 48,
      pickerItemHeight: 50,
      cancelButton: cancelButton,
      commitButton: commitButton,
      headDecoration: headDecoration,
      backgroundColor: Colors.white,
      textColor: const Color(0xff666666),
      textSize: 13.0);
}
