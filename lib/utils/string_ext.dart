import 'package:flutter/material.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/utils/text_util.dart';

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
  static String dealEndZero(String str) {
    if (!ObjectUtil.isEmptyString(str)) {
      if (str.endsWith('.0') || str.endsWith('.00')) {
        var index = str.indexOf('.');
        var newStr = str.substring(0, index);
        return newStr;
      }
    }
    return str;
  }

  static String formatPrice(String str) {
    if (!ObjectUtil.isEmptyString(str)) {
      if (str.contains('.')) {
        var index = str.indexOf('.');
        var beginStr = str.substring(0, index);
        var endStr = str.substring(index + 1, str.length);
        if (num.tryParse(beginStr) is int) {
          var strBegin = TextUtil.formatComma3(beginStr);
          var str = '$strBegin.$endStr';
          if (str.endsWith('.0')) {
            str = '${str}0';
          }
          return str;
        }
      } else {
        if (num.tryParse(str) is int) {
          var strBegin = TextUtil.formatComma3(str);
          return strBegin;
        }
      }
    }
    return str;
  }

  static String addEndZero(String str) {
    if (!ObjectUtil.isEmptyString(str)) {
      if (str.contains('.')) {
        var index = str.indexOf('.');
        var beginStr = str.substring(0, index);
        var endStr = str.substring(index + 1, str.length);
        if (num.tryParse(beginStr) is int) {
          var strBegin = TextUtil.formatComma3(beginStr);
          var str = '$strBegin.$endStr';
          if (str.endsWith('.0')) {
            str = '${str}0';
          }
          return str.strWithDollar();
        }
      } else {
        if (num.tryParse(str) is int) {
          var strBegin = TextUtil.formatComma3(str);
          return '$strBegin.00'.strWithDollar();
        }
      }
    }
    return str;
  }
}
