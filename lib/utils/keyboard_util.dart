import 'package:flutter/cupertino.dart';

class KeyboardUtils {
  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
