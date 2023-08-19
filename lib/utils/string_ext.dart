

import 'package:flutter/material.dart';
import 'package:rapicredito/utils/object_util.dart';

extension StringSpaceRemove on String {
  String strRvSpace() {
    return replaceAll(RegExp(r'\s+\b|\b\s'), '');
  }
}

extension _FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}

class Strings {
  ///防止文字自动换行
  static String autoLineString(String str){
    if(!ObjectUtil.isEmptyString(str)){
      return str.fixAutoLines();
    }
    return '';
  }
}

