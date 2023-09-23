import 'package:flutter/material.dart';
import 'package:rapicredito/widget/pickers/more_pickers/init_data.dart';
import 'package:rapicredito/widget/pickers/more_pickers/route/multiple_link_picker_route.dart';
import 'package:rapicredito/widget/pickers/more_pickers/route/multiple_picker_route.dart';
import 'package:rapicredito/widget/pickers/more_pickers/route/single_picker_route.dart';
import 'package:rapicredito/widget/pickers/style/default_style.dart';
import 'package:rapicredito/widget/pickers/style/picker_style.dart';
import 'package:rapicredito/widget/pickers/time_picker/model/date_item_model.dart';
import 'package:rapicredito/widget/pickers/time_picker/model/date_mode.dart';
import 'package:rapicredito/widget/pickers/time_picker/model/pduration.dart';
import 'package:rapicredito/widget/pickers/time_picker/model/suffix.dart';
import 'package:rapicredito/widget/pickers/time_picker/route/date_picker_route.dart';


class Pickers {
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
      // theme: Theme.of(context, shadowThemeOnly: true),
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }


  static void showMultiPicker(BuildContext context,
      {required List<List> data,
      List? selectData,
      List? suffix,
      PickerStyle? pickerStyle,
      MultipleCallback? onChanged,
      MultipleCallback? onConfirm,
      Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    selectData ??= [];

    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    Navigator.of(context, rootNavigator: overlapTabBar)
        .push(MultiplePickerRoute(
      data: data,
      selectData: selectData,
      suffix: suffix,
      pickerStyle: pickerStyle,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      // theme: Theme.of(context, shadowThemeOnly: true),
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }

  static void showMultiLinkPicker(BuildContext context,
      {required dynamic data,
      required int columeNum,
      List? selectData,
      List? suffix,
      PickerStyle? pickerStyle,
      MultipleLinkCallback? onChanged,
      MultipleLinkCallback? onConfirm,
      Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    assert(data is Map, 'params : data must Map');

    selectData ??= [];

    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    Navigator.of(context, rootNavigator: overlapTabBar)
        .push(MultipleLinkPickerRoute(
      data: data,
      selectData: selectData,
      columeNum: columeNum,
      suffix: suffix,
      pickerStyle: pickerStyle,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      // theme: Theme.of(context, shadowThemeOnly: true),
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }

  static void showDatePicker(BuildContext context,
      {DateMode mode= DateMode.DMY,
      PDuration? selectDate,
      PDuration? maxDate,
      PDuration? minDate,
      Suffix? suffix,
      PickerStyle? pickerStyle,
      DateCallback? onChanged,
      DateCallback? onConfirm,
      Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    selectDate ??= PDuration.now();
    suffix ??= Suffix.normal();

    DateItemModel dateItemModel = DateItemModel.parse(mode);

    maxDate ??= PDuration(year: 2100);
    minDate ??= PDuration(year: 1900);

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
      // theme: Theme.of(context, shadowThemeOnly: true),
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }
}
