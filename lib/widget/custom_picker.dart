import 'package:flutter/material.dart';
import 'package:flutter_pickers/more_pickers/init_data.dart';
import 'package:flutter_pickers/more_pickers/route/single_picker_route.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_item_model.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:flutter_pickers/time_picker/route/date_picker_route.dart';

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

  static void showDatePicker(BuildContext context,
      {DateMode mode = DateMode.YMD,
      PDuration? selectDate,
      PDuration? maxDate,
      PDuration? minDate,
      Suffix? suffix,
      PickerStyle? pickerStyle,
      DateCallback? onChanged,
      DateCallback? onConfirm,
      Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    pickerStyle ??= customizeStyle();
    pickerStyle.context ??= context;
    selectDate ??= PDuration.now();
    suffix ??= Suffix(years: ' year ', month: ' month ', days: ' day ');
    DateItemModel dateItemModel = DateItemModel.parse(mode);
    DateTime dateTime = DateTime.now();
    var maxYear = dateTime.year - 10;
    var maxMonth=dateTime.month;
    var maxDay=dateTime.day;
    maxDate ??= PDuration(year: maxYear,month: maxMonth,day: maxDay);
    minDate ??= PDuration(year: 1950, month: 1, day: 1);

    if ((dateItemModel.day || dateItemModel.year)) {
      if (intEmpty(selectDate.year)) {
        selectDate.year = DateTime.now().year;
      }

      if (intEmpty(maxDate.year)) maxDate.year = 2100;
      if (intEmpty(minDate.year)) minDate.year = 1900;

      if (dateItemModel.month || dateItemModel.day) {
        assert(minDate.year! > 1582, 'min Date Year must > 1582');
      }
    }

    Navigator.of(context, rootNavigator: overlapTabBar).push(DatePickerRoute(
      mode: mode,
      initDate: selectDate,
      maxDate: maxDate,
      minDate: minDate,
      suffix: suffix,
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
      textColor: const Color(0xff666666));
}
