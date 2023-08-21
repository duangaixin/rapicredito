import 'dart:convert' as convert;
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:rapicredito/local/app_constants.dart';

class Log {
  static const String tag = 'HC-LOG';

  static void init() {
    _LogUtil.init(isDebug: !AppConstants.inProduction);
  }

  static void d(String msg, {String tag = tag}) {
    if (!AppConstants.inProduction) {
      _LogUtil.v(msg, tag: tag);
    }
  }

  static void e(String msg, {String tag = tag}) {
    if (!AppConstants.inProduction) {
      _LogUtil.e(msg, tag: tag);
    }
  }

  static void json(String msg, {String tag = tag}) {
    if (!AppConstants.inProduction) {
      try {
        final dynamic data = convert.json.decode(msg);
        if (data is Map) {
          _printMap(data);
        } else if (data is List) {
          _printList(data);
        } else {
          _LogUtil.v(msg, tag: tag);
        }
      } catch (e) {
        _LogUtil.e(msg, tag: tag);
      }
    }
  }

  static void _printMap(Map data,
      {String tag = tag,
      int tabs = 1,
      bool isListItem = false,
      bool isLast = false}) {
    final bool isRoot = tabs == 1;
    final String initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) {
      _LogUtil.v('$initialIndent{', tag: tag);
    }

    data.keys.toList().asMap().forEach((index, dynamic key) {
      final bool isLast = index == data.length - 1;
      dynamic value = data[key];
      if (value is String) {
        value = '"$value"';
      }
      if (value is Map) {
        if (value.isEmpty) {
          _LogUtil.v('${_indent(tabs)} $key: $value${!isLast ? ',' : ''}',
              tag: tag);
        } else {
          _LogUtil.v('${_indent(tabs)} $key: {', tag: tag);
          _printMap(value, tabs: tabs);
        }
      } else if (value is List) {
        if (value.isEmpty) {
          _LogUtil.v('${_indent(tabs)} $key: ${value.toString()}', tag: tag);
        } else {
          _LogUtil.v('${_indent(tabs)} $key: [', tag: tag);
          _printList(value, tabs: tabs);
          _LogUtil.v('${_indent(tabs)} ]${isLast ? '' : ','}', tag: tag);
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        _LogUtil.v('${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}',
            tag: tag);
      }
    });

    _LogUtil.v('$initialIndent}${isListItem && !isLast ? ',' : ''}', tag: tag);
  }

  static void _printList(List list, {String tag = tag, int tabs = 1}) {
    list.asMap().forEach((i, dynamic e) {
      final bool isLast = i == list.length - 1;
      if (e is Map) {
        if (e.isEmpty) {
          _LogUtil.v('${_indent(tabs)}  $e${!isLast ? ',' : ''}', tag: tag);
        } else {
          _printMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        _LogUtil.v('${_indent(tabs + 2)} $e${isLast ? '' : ','}', tag: tag);
      }
    });
  }

  static String _indent([int tabCount = 1]) => '  ' * tabCount;
}

class _LogUtil {
  static const String _defTag = 'log_utils';
  static bool _debugMode = false;
  static int _maxLen = 128;
  static String _tagValue = _defTag;

  static void init({
    String tag = _defTag,
    bool isDebug = false,
    int maxLen = 128,
  }) {
    _tagValue = tag;
    _debugMode = isDebug;
    _maxLen = maxLen;
  }

  static void d(Object? object, {String? tag}) {
    if (_debugMode) {
      log('$tag d | ${object?.toString()}');
    }
  }

  static void e(Object? object, {String? tag}) {
    _printLog(tag, ' e ', object);
  }

  static void v(Object? object, {String? tag}) {
    if (_debugMode) {
      _printLog(tag, ' v ', object);
    }
  }

  static void _printLog(String? tag, String stag, Object? object) {
    String da = object?.toString() ?? 'null';
    tag = tag ?? _tagValue;
    if (da.length <= _maxLen) {
      debugPrint('$tag$stag $da');
      return;
    }
    debugPrint(
        '$tag$stag — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —');
    while (da.isNotEmpty) {
      if (da.length > _maxLen) {
        debugPrint('$tag$stag| ${da.substring(0, _maxLen)}');
        da = da.substring(_maxLen, da.length);
      } else {
        debugPrint('$tag$stag| $da');
        da = '';
      }
    }
    debugPrint(
        '$tag$stag — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —');
  }
}
