import 'package:flutter/material.dart';
import 'package:rapicredito/utils/object_util.dart';

extension StringSpaceRemove on String {
  String strRvSpace() {
    return replaceAll(RegExp(r'\s+\b|\b\s'), '');
  }
}
extension StringWithDollar on String {
  String strWithDollar() {
    return '$this \$';
  }
}
extension _FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}

class Strings {
  static String autoLineString(String str) {
    if (!ObjectUtil.isEmptyString(str)) {
      return str.fixAutoLines();
    }
    return '';
  }
}
