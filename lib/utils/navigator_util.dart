import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class NavigatorUtil {
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    } else {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      }
    }
  }
}
